function  EffC_Calculator_polar(app)
%% Initial state
app.Parameters.Effective_concentrations = struct();
app.Parameters.EffCs = struct();
if app.Parameters.Receptor(1).Valency > 1 && (app.Parameters.Ligand(1).Valency > 1 || app.Parameters.Ligand(2).Valency > 1 || app.Parameters.Ligand(3).Valency > 1)

%Progress_steps = nchoosek(app.Parameters.Receptor(1).Valency,2) + nchoosek(app.Parameters.Ligand(1).Valency,2) + nchoosek(app.Parameters.Ligand(2).Valency,2) + nchoosek(app.Parameters.Ligand(3).Valency,2);
%Progress_step_size = ceil(300*0.6/Progress_steps);
%Progress_bar_size = 1;
%app.Progress_text.Text = 'Calculateing Effective Conc';

for ligand_i = 1:size(app.Parameters.Ligand,2)
    if app.Parameters.Ligand(ligand_i).Valency == 0
        continue
    end
    PDF = PDF_calculator(app.Parameters.Ligand(ligand_i).LinkerLength, app.Parameters.Ligand(ligand_i).LinkerLP, app.Parameters.Ligand(ligand_i).Diameter, app.Parameters.Ligand(ligand_i).Valency);
    
    number_of_binding_states = 1;
    for position_from_i = 1:(app.Parameters.Ligand(ligand_i).Valency-1)
        for position_to_i = (position_from_i+1):app.Parameters.Ligand(ligand_i).Valency
            
            if isfield(app.Parameters.Ligand(ligand_i), "binding_state")
                if isfield(app.Parameters.Ligand(ligand_i).binding_state, "user_input")
                    if length(app.Parameters.Ligand(ligand_i).binding_state)>=number_of_binding_states
                        if app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).user_input == 1
                            app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).user_input = 0;
                            number_of_binding_states = number_of_binding_states + 1;
                            continue
                        end
                    end
                end
            end            
            
            app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states) = struct( ...
            "name",strcat("Ligand", num2str(ligand_i), "_from", num2str(position_from_i), "_to", num2str(position_to_i), "_0"), ...
            "position_from",position_from_i, ...
            "position_to", position_to_i, ...
            "position_limiting", 0, ...
            "LinkerLength", app.Parameters.Ligand(ligand_i).LinkerLength, ...
            "LinkerLP", app.Parameters.Ligand(ligand_i).LinkerLP, ...
            "Diameter", app.Parameters.Ligand(ligand_i).Diameter, ...
            "user_input", 0, ...
            "PDF_x", [], ...
            "PDF_y", [], ...
            "PDF_length", []);
            % linker and diameter can be a vector
            if  position_to_i - position_from_i ==1
                 app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).PDF_x = ...
                     PDF.PDF_one_jump(position_from_i).x_for_interpol;
                 app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).PDF_y = ...
                     PDF.PDF_one_jump(position_from_i).y_for_interpol;
                 app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).PDF_length = ...
                     PDF.PDF_one_jump(position_from_i).length;
            elseif position_to_i - position_from_i ==2
                 app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).PDF_x = ...
                     PDF.PDF_two_jump(position_from_i).x_for_interpol;
                 app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).PDF_y = ...
                     PDF.PDF_two_jump(position_from_i).y_for_interpol;
                 app.Parameters.Ligand(ligand_i).binding_state(number_of_binding_states).PDF_length = ...
                     PDF.PDF_two_jump(position_from_i).length;
            end
        
            number_of_binding_states = number_of_binding_states + 1;            
            
            progress = ceil(ligand_i*((150-30)/(size(app.Parameters.Ligand,2)+size(app.Parameters.Receptor,2))));
            app.ProgressButton.Position(3)=30+progress;
            drawnow()
    
        end
    end
end

for receptor_i = 1:size(app.Parameters.Receptor,2)
    
    PDF = PDF_calculator(app.Parameters.Receptor(receptor_i).LinkerLength, app.Parameters.Receptor(receptor_i).LinkerLP, app.Parameters.Receptor(receptor_i).Diameter, app.Parameters.Receptor(receptor_i).Valency);
    
    
    number_of_binding_states = 1;
    for position_from_i = 1:(app.Parameters.Receptor(receptor_i).Valency-1)
        for position_to_i = (position_from_i+1):app.Parameters.Receptor(receptor_i).Valency
            
            if isfield(app.Parameters.Receptor(receptor_i), "binding_state")
                if isfield(app.Parameters.Receptor(receptor_i).binding_state, "user_input")
                    if length( app.Parameters.Receptor(receptor_i).binding_state) >= number_of_binding_states
                        if app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).user_input == 1
                            app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).user_input = 0;
                            number_of_binding_states = number_of_binding_states + 1;
                            continue
                        end
                    end
                end
            end
            app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states) = struct( ...
            "name",strcat("Receptor", num2str(receptor_i), "_from", num2str(position_from_i), "_to", num2str(position_to_i), "_0"), ...
            "position_from",position_from_i, ...
            "position_to", position_to_i, ...
            "position_limiting", 0, ...
            "LinkerLength", app.Parameters.Receptor(receptor_i).LinkerLength, ...
            "LinkerLP", app.Parameters.Receptor(receptor_i).LinkerLP, ...
            "Diameter", app.Parameters.Receptor(receptor_i).Diameter, ...
            "user_input", 0, ...
            "PDF_x", [], ...
            "PDF_y", [], ...
            "PDF_length", []);
        
        
            if  position_to_i - position_from_i ==1
                 app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).PDF_x = ...
                     PDF.PDF_one_jump(position_from_i).x_for_interpol;
                 app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).PDF_y = ...
                     PDF.PDF_one_jump(position_from_i).y_for_interpol;
                 app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).PDF_length = ...
                     PDF.PDF_one_jump(position_from_i).length;
            elseif position_to_i - position_from_i ==2
                 app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).PDF_x = ...
                     PDF.PDF_two_jump(position_from_i).x_for_interpol;
                 app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).PDF_y = ...
                     PDF.PDF_two_jump(position_from_i).y_for_interpol;
                 app.Parameters.Receptor(receptor_i).binding_state(number_of_binding_states).PDF_length = ...
                     PDF.PDF_two_jump(position_from_i).length;
            end
            
            number_of_binding_states = number_of_binding_states + 1;
            
            progress = ceil((receptor_i+size(app.Parameters.Ligand,2))*((150-30)/(size(app.Parameters.Ligand,2)+size(app.Parameters.Receptor,2))));
            app.ProgressButton.Position(3)=30+progress;
            drawnow()
        end
    end
end
%% Adding user defined PDFs
% app.Parameters.Ligand(1).binding_state(1).PDF_x = 
% app.Parameters.Ligand(1).binding_state(1).PDF_y =
% 
% app.Parameters.Ligand(2).binding_state(1).PDF_x = 
% app.Parameters.Ligand(2).binding_state(1).PDF_y =

%% Calculation of the [Leff]
size(app.Parameters.Receptor,2)


number_of_EffC = 1;
app.Parameters.Effective_concentrations = struct();
for receptor_i = 1:size(app.Parameters.Receptor,2)
    for receptor_state_i = 1:size(app.Parameters.Receptor(receptor_i).binding_state,2)
        for ligand_i = 1:size(app.Parameters.Ligand,2)
                if app.Parameters.Ligand(ligand_i).Valency < 2 
                    continue
                end
            for ligand_state_i = 1:size(app.Parameters.Ligand(ligand_i).binding_state,2)
                [EffC_reverse, EffC_straight] = EffC_convolution( ...
                    app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i), ...
                    app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i), ...
                    ligand_i, app);
                
                app.Parameters.Effective_concentrations.EffC(number_of_EffC) = struct( ...
                    "name", strcat("EffC_inline_", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).name,"_", ...
                        app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).name), ...
                    "shortname", "", ...
                    "ligand_state", app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).name, ...
                    "ligand_position_from", app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_from, ...
                    "ligand_position_to", app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_to, ...
                    "receptor_state", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).name, ...
                    "receptor_position_from", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_from, ...
                    "receptor_position_to", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_to, ...
                    "Value", EffC_straight, ...
                    "restriction", "straight", ...
                    "Kon",strcat("Kon_Ligand",num2str(ligand_i), "_pos_", num2str(app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_to), ... 
                        "_Receptor", num2str(receptor_i), "_pos_",  num2str(app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_to)), ...
                     "Koff",strcat("Kooff_Ligand",num2str(ligand_i), "_pos_", num2str(app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_to), ... 
                        "_Receptor", num2str(receptor_i), "_pos_",  num2str(app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_to)) ...                 
                    , "ligand_rank", string(ligand_i));
                app.Parameters.Effective_concentrations.EffC(number_of_EffC+1) = struct(...
                    "name", strcat("EffC_reverse_", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).name,"_", ...
                        app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).name), ...
                    "shortname", "", ...
                    "ligand_state", app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).name, ...
                    "ligand_position_from", app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_from, ...
                    "ligand_position_to", app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_to, ...
                    "receptor_state", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).name, ...
                    "receptor_position_from", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_from, ...
                    "receptor_position_to", app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_to, ...
                    "Value", EffC_reverse, ...
                    "restriction", "reverse", ...
                    "Kon",strcat("Kon_Ligand",num2str(ligand_i), "_pos_", num2str(app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_to), ... 
                        "_Receptor", num2str(receptor_i), "_pos_",  num2str(app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_to)), ...
                    "Koff",strcat("Koff_Ligand",num2str(ligand_i), "_pos_", num2str(app.Parameters.Ligand(ligand_i).binding_state(ligand_state_i).position_to), ... 
                        "_Receptor", num2str(receptor_i), "_pos_",  num2str(app.Parameters.Receptor(receptor_i).binding_state(receptor_state_i).position_to)) ...
                    , "ligand_rank", string(ligand_i));
                
                number_of_EffC = number_of_EffC+2;
            end
            progress = ceil(((size(app.Parameters.Receptor(receptor_i).binding_state,2)*(receptor_state_i-1))+ligand_i)*((200-150)...
                /(size(app.Parameters.Ligand,2)*size(app.Parameters.Receptor(receptor_i).binding_state,2))));
            app.ProgressButton.Position(3)=150+progress;
            drawnow()
        end        
    end
end

end

%%

end

function PDF = PDF_calculator(Lenght_Counture, Length_Persistance, unit_diameter, valency)


% Lenght_Counture = [100,100];
% Length_Persistance = [5,5];
% unit_diameter = [30,30,30];
% valency = 3;

if valency == 1
    PDF = 1;
    return
end

PDF_steps = struct("x_for_interpol",[],"y_for_interpol",[],"length",0);
% Creating the unit-linker components
for repeat_i = 1:valency-1
    % Convolution of 1 linker and one unit
    f_root  = general_linker_PDF(Lenght_Counture(repeat_i), Length_Persistance(repeat_i));
    [x_for_interpol, y_for_interpol]   = add_unit(f_root, Lenght_Counture(1), unit_diameter(repeat_i)/2);
    PDF_steps(repeat_i).x_for_interpol = x_for_interpol;
    PDF_steps(repeat_i).y_for_interpol = y_for_interpol;
    PDF_steps(repeat_i).length = Lenght_Counture(repeat_i) + unit_diameter(repeat_i)/2;    
    %f_Ligand = @(x) interp1(x_for_interpol, y_for_interpol,x); 
end

PDF.PDF_one_jump = struct("x_for_interpol",[],"y_for_interpol",[],"length",0);
for repeat_i = 1:valency-1
% Convolution of linker-unit components with the next unit
    f_root = @(x) interp1(PDF_steps(repeat_i).x_for_interpol, PDF_steps(repeat_i).y_for_interpol,x);
    [x_for_interpol, y_for_interpol]   = add_unit(f_root, PDF_steps(repeat_i).length, unit_diameter(repeat_i+1)/2);
    PDF.PDF_one_jump(repeat_i).x_for_interpol = x_for_interpol;
    PDF.PDF_one_jump(repeat_i).y_for_interpol = y_for_interpol;
    PDF.PDF_one_jump(repeat_i).length = PDF_steps(repeat_i).length + unit_diameter(repeat_i+1)/2;    
end

PDF.PDF_two_jump = struct("x_for_interpol",[],"y_for_interpol",[],"length",0);
for repeat_i = 1:valency-2  
% 1U1L + 2U2L -> 1U1L2U2L  
    f_root1 = @(x) interp1(PDF_steps(repeat_i).x_for_interpol, PDF_steps(repeat_i).y_for_interpol,x);
    f_root2 = @(x) interp1(PDF_steps(repeat_i+1).x_for_interpol, PDF_steps(repeat_i+1).y_for_interpol,x);
    [x_for_interpol, y_for_interpol]   = add_function(f_root1 ,f_root2,PDF_steps(repeat_i).length, PDF_steps(repeat_i+1).length);%add_function(f_Ligand12,f_Ligand23 , length_Ligand12, length_Ligand23);
    PDF.PDF_two_jump(repeat_i).x_for_interpol = x_for_interpol;
    PDF.PDF_two_jump(repeat_i).y_for_interpol = y_for_interpol;
    PDF.PDF_two_jump(repeat_i).length = PDF_steps(repeat_i).length + PDF_steps(repeat_i+1).length;    

% 1U1L2U2L + 3U  -> 1U1L2U2L3U
    f_root = @(x) interp1(PDF.PDF_two_jump(repeat_i).x_for_interpol, PDF.PDF_two_jump(repeat_i).y_for_interpol,x);
    [x_for_interpol, y_for_interpol]   = add_unit(f_root, PDF.PDF_two_jump(repeat_i).length, unit_diameter(repeat_i+2));
    PDF.PDF_two_jump(repeat_i).x_for_interpol = x_for_interpol;
    PDF.PDF_two_jump(repeat_i).y_for_interpol = y_for_interpol;
    PDF.PDF_two_jump(repeat_i).length = PDF.PDF_two_jump(repeat_i).length + unit_diameter(repeat_i+2)/2;  
end

end

function [reverse_value, straight_value] = EffC_convolution(receptor, ligand, ligand_rank, app)
    %% Effective concentration value
    % radial simmetric function integral - Math proof I
    
    f_Receptor = @(x) interp1(receptor.PDF_x, receptor.PDF_y,x);
    f_Ligand = @(x) interp1(ligand.PDF_x, ligand.PDF_y,x);
    length_Ligand = ligand.PDF_length;
    length_Receptor = receptor.PDF_length;
    
    %figure
    %f_Receptor_plot = @(x)  f_Receptor(x).*x.^2;
    %fplot(f_Receptor_plot, [0, max(length_Ligand, length_Receptor)])
    %title(["receptor", ligand_rank])
    %figure
    %f_Ligand_plot = @(x)  f_Ligand(x).*x.^2;
    %fplot(f_Ligand_plot, [0,  max(length_Ligand, length_Receptor)])
    %title(["ligand", ligand_rank])
    
    c_norm_Receptor = integral(@(x) (4*pi.*x.^2).*f_Receptor(x),0,length_Receptor);
    c_norm_Ligand = integral(@(x) (4*pi.*x.^2).*f_Ligand(x),0,length_Ligand);
    
    Ligand_unit = (app.Parameters.Ligand(ligand_rank).Diameter(ligand.position_from)+app.Parameters.Ligand(ligand_rank).Diameter(ligand.position_to))/2;
    Receptor_unit = (app.Parameters.Receptor.Diameter(receptor.position_from)+app.Parameters.Receptor.Diameter(receptor.position_to))/2;


    %% Straight calculation 
    shift= ceil(Ligand_unit + Receptor_unit);
    final_conv =  @(r,z) f_Receptor(sqrt(r.^2+z.^2)).*f_Ligand(sqrt(r.^2+(z+shift).^2)).*r; % in 1D final_conv = @(r) f_Receptor(r).*f_Ligand(r).*r.^2;
    value = 2*pi*integral2(final_conv, 0,min(length_Receptor, length_Ligand)+shift,-min(length_Receptor, length_Ligand)+shift,min(length_Receptor, length_Ligand)+shift);
                                                                            % in 1D  value = 4*pi*integral(final_conv, 0,min(length_Receptor, length_Ligand));
    % Normaliseing in the final step - Math proof II
    reverse_value  = value/(c_norm_Receptor*c_norm_Ligand)/(6*(10^-4));
    
    %% Reverse calculation
    shift= ceil(Ligand_unit + Receptor_unit)/2;   
    final_conv =  @(r,z) f_Receptor(sqrt(r.^2+z.^2)).*f_Ligand(sqrt(r.^2+(z+shift).^2)).*r; % in 1D final_conv = @(r) f_Receptor(r).*f_Ligand(r).*r.^2;
    value = 2*pi*integral2(final_conv, 0,min(length_Receptor, length_Ligand)+shift,-min(length_Receptor, length_Ligand)+shift,min(length_Receptor, length_Ligand)+shift);
                                                                            % in 1D  value = 4*pi*integral(final_conv, 0,min(length_Receptor, length_Ligand));
    % Normaliseing in the final step - Math proof II
    straight_value = value/(c_norm_Receptor*c_norm_Ligand)/(6*(10^-4));
%fplot(f_Ligand,[0,length_Ligand])
end

function [x,y] = add_function(f_root, f_toadd, root_length, toadd_length, reverse_direction)
%% Input check
    if nargin ==4
        reverse_direction=false;
    end
    
    if toadd_length < root_length
        temp_function = f_root;
        temp_length = root_length;
        f_root = f_toadd;
        root_length = toadd_length;
        f_toadd = temp_function;
        toadd_length = temp_length;
        
    end
    
fr = @(r0, fi0,r) f_root(r0).*f_toadd(sqrt(r.^2+r0.^2-2.*r.*r0.*cos(fi0))).*r0.^2.*sin(fi0);
x = 0:(root_length+toadd_length)/300:(root_length+toadd_length); %y = arrayfun(@(r) quad2d(@(r0, fi0) fr(r0,fi0,r),0,root_length,0, @() range_fi(r), 'AbsTol', 1e-6,'RelTol', 1e-3, 'MaxFunEvals', 10000), x); %, 'MaxFunEvals', 10000


for i = 1:301
    r0_max = min(root_length, x(i)+toadd_length);
    r0_min = max(0, x(i)-toadd_length );
    if x(i) > toadd_length
        fi_max = asin(toadd_length/x(i));
        y(i) = quad2d(@(r0, fi0) fr(r0,fi0,x(i)) ,r0_min,r0_max,0, fi_max, 'AbsTol', 1e-10,'RelTol', 1e-4, 'MaxFunEvals', 20000);
    else
        y(i) = quad2d(@(r0, fi0) fr(r0,fi0,x(i)) ,r0_min,r0_max,0, pi, 'AbsTol', 1e-10,'RelTol', 1e-4, 'MaxFunEvals', 20000);
    end
end

%% Flips x axis if reverse direction is needed
    if reverse_direction == true 
        x = (root_length+toadd_length) - x;  
    end
x = [x,(root_length+toadd_length)*1.001,1e10];
y = [y,0,0];

end

function [x,y] = add_unit(f_root, root_length, unit_diameter,reverse_direction)
%% Input check
    if nargin ==3
        reverse_direction=false;
    end
%% Unit lenght setup
    d_max=1.05*unit_diameter;
    d_min=0.95*unit_diameter;

%% Function to integrate, and its range
    %range_fi = @(r0,r) min(pi, acos((r.^2+r0.^2-toadd_length^2)./(2.*r.*r0)));
    fr = @(d,fi,r) f_root(sqrt(d.^2+r.^2-2.*d.*r.*cos(fi))).*d.^2.*sin(fi);
    
    root_constant = integral(@(x) (4*pi.*x.^2).*f_root(x),0,root_length);
    %fr_nofi = @(d,r) f_root(max(0,r-d));
    x = 0:(root_length+d_max)/300:(root_length+d_max);

    %y = arrayfun(@(r) quad2d(@(d,fi) fr(d,fi,r),d_min,d_max,0,pi, 'AbsTol', 1e-6,'RelTol', 1e-3,'MaxFunEvals', 10000), x); %, 'MaxFunEvals', 10000

    for i = 1:301
        if x(i) > root_length
            fi_max = asin(root_length/x(i));
            y(i) = quad2d(@(d,fi) fr(d,fi,x(i)),d_min,d_max,0,fi_max, 'AbsTol', root_constant/1000000,'RelTol', 1e-4,'MaxFunEvals', 10000);
        else
            y(i) = quad2d(@(d,fi) fr(d,fi,x(i)),d_min,d_max,0,pi, 'AbsTol', root_constant/1000000,'RelTol', 1e-4,'MaxFunEvals', 10000);
        end
    end
    

%% Flips x axis if reverse direction is needed
    if reverse_direction == true 
        x = (root_length+d_max) - x;  
    end
    x = [x,(root_length+d_max)*1.001,1e10];
    y = [y,0,0];
end

function fx = general_linker_PDF(Lenght_Counture, Length_Persistance)
    fx = @(r)  max(0,real(  (1./(1-(r.^2/Lenght_Counture^2) ).^4.5 ).*       exp(-(9*Lenght_Counture/(8*Length_Persistance))./(1-(r.^2/Lenght_Counture^2)) ) ));
end

