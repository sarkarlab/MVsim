dataset_option = 1;
[Parameters,TimePoints]  = Initiate_Parameters(dataset_option);
[xy_true] = read_time_series(dataset_option);

option = 2;

switch option
    case 1
        kon_pred =  optimizableVariable('kon', [1e5 1e7],  'Transform','log');
        %KD_pred =   optimizableVariable('KD',  [1e-4 1e-3],'Transform','log');
        koff_pred = optimizableVariable('koff',[1e-1 1e2], 'Transform','log');
        %RU_pred = 0.9; %optimizableVariable('RU',[0.8 1]);
        fun = @(X) F_test(X.kon, X.koff,Parameters,TimePoints,xy_true);
        vars = [kon_pred,koff_pred];
    case 2
        eff1 = optimizableVariable('e1',[1e-10 1],'Transform','log');
        eff2 = optimizableVariable('e2',[1e-10 1],'Transform','log');
        eff3 = optimizableVariable('e3',[1e-10 1],'Transform','log');
        eff4 = optimizableVariable('e4',[1e-10 1],'Transform','log');
        fun = @(X) F_test(X.e1, X.e2, X.e3, X.e4 ,Parameters,TimePoints,xy_true);
        vars = [eff1,eff2,eff3,eff4];
    case 3
        eff1 = optimizableVariable('e1',[1e-10 1],'Transform','log');
        eff2 = optimizableVariable('e2',[1e-10 1],'Transform','log');
        fun = @(X) F_test(X.e1, X.e2,Parameters,TimePoints,xy_true);
        vars = [eff1,eff2];
    case 4
        RU_pred = optimizableVariable('RU',[1e-2 100]);
        fun = @(X) F_test(X.RU, Parameters,TimePoints,xy_true);
        vars = RU_pred;
    case 5
        eff1 = optimizableVariable('e1',[1e-10 10],'Transform','log');
        eff2 = optimizableVariable('e2',[1e-10 10],'Transform','log');
        eff3 = optimizableVariable('e3',[1e-10 10],'Transform','log');
        fun = @(X) F_test(X.e1, X.e2, X.e3 ,Parameters,TimePoints,xy_true);
        vars = [eff1,eff2,eff3];
end




%xconstraint = @(X)((X.kon./X.koff > 500) & (X.kon./X.koff < 10000));

results = bayesopt(fun,vars,...
    'Verbose',1,...
    'UseParallel',true,...
    'GPActiveSetSize',150,...
    'NumSeedPoints',100,...
    'ExplorationRatio',0.2,...
    'MaxObjectiveEvaluations',300,...
    'IsObjectiveDeterministic',true);
    %'XConstraintFcn',@xcon,...



