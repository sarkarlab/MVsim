function dydt = Diff_2R1LA_3LB_2LC(t,y, app) 

L1 = app.Parameters.SPR.LtempL1;
L2 = app.Parameters.SPR.LtempL2;
L3 = app.Parameters.SPR.LtempL3;
Kons = app.Parameters.Kons;
Koffs = app.Parameters.Koffs;
EffCs = app.Parameters.EffCs;

dydt = zeros(57,1);
dydt(1)=+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(2)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(3)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(4)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(5)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(6)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(7)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(8)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(15)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(24)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(33)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(42)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(50)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(1)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(1)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(1)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(1)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(1)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(1)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(1)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(1);
dydt(2)=+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(9)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(16)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(25)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(34)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(43)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(51)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(2)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(2)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(2)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(2)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(2);
dydt(3)=+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(10)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(19)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(26)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(28)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(35)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(37)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(44)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(52)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(3)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(3)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(3)-Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(3)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(3)-Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(3)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(3);
dydt(4)=+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(11)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(17)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(20)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(29)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(36)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(38)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(45)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(53)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(4)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(4)-Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(4)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(4)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(4)-Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(4)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(4)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(4)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(4);
dydt(5)=+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(12)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(18)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(21)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(27)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(30)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(39)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(46)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(54)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(5)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(5)-Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(5)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(5)-Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(5)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(5)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(5)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(5)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(5);
dydt(6)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(13)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(22)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(31)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(40)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(48)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(55)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(56)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(6)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(6)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(6)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(6)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(6)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(6)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(6)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(6);
dydt(7)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(14)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(23)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(32)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(41)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(47)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(49)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(57)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(7)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(7)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(7)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(7)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(7)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(7)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(7)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(7);
dydt(8)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(9)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(10)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(11)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(12)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(13)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(14)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(8)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(8)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(8)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(8)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(8)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(8)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(8);
dydt(9)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(9)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(9);
dydt(10)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(10)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(10);
dydt(11)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(4)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(11)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(11);
dydt(12)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(5)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(12)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(12);
dydt(13)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(6)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(13)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(13);
dydt(14)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(7)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(14)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(14);
dydt(15)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(16)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(17)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(18)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(19)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(20)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(21)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(22)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(23)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(15)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(15)-Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(15)-Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(15)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(15)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(15)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(15)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(15)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(15);
dydt(16)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(16)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(16);
dydt(17)=+Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(4)+Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(17)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(17);
dydt(18)=+Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(5)+Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(18)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(18);
dydt(19)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(19)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(19);
dydt(20)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(4)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(20)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(20);
dydt(21)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(5)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(21)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(21);
dydt(22)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(6)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(22)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(22);
dydt(23)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(7)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(15)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(23)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(23);
dydt(24)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(25)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(26)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(27)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(28)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(29)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(30)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(31)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(32)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(24)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(24)-Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(24)-Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(24)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(24)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(24)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(24)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(24)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(24);
dydt(25)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(25)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(25);
dydt(26)=+Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(3)+Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(26)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(26);
dydt(27)=+Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(5)+Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(27)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(27);
dydt(28)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(28)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(28);
dydt(29)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(4)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(29)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(29);
dydt(30)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(5)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(30)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(30);
dydt(31)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(6)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(31)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(31);
dydt(32)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_2*y(7)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_2*y(32)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(32);
dydt(33)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(34)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(35)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(36)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(37)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(38)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(39)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(40)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(41)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(33)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(33)-Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(33)-Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(33)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(33)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(33)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(33)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(33)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(33);
dydt(34)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(34)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(34);
dydt(35)=+Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(3)+Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to3_0*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(35)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(35);
dydt(36)=+Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(4)+Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(36)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(36);
dydt(37)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(37)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(37);
dydt(38)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(4)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(38)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(38);
dydt(39)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(5)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(39)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(39);
dydt(40)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(6)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(40)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(40);
dydt(41)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_3*y(7)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(33)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_3*y(41)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(41);
dydt(42)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(43)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(44)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(45)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(46)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(47)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(48)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(49)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(42)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(42)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(42)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(42)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(42)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(42)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(42)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(42);
dydt(43)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(42)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(43)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(43);
dydt(44)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(42)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(44)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(44);
dydt(45)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(4)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(42)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(45)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(45);
dydt(46)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(5)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(42)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(46)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(46);
dydt(47)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(7)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(42)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(47)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(47);
dydt(48)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(6)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(42)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(48)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(48);
dydt(49)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(7)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(42)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(49)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(49);
dydt(50)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(51)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(52)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(53)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(54)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(55)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(56)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(57)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(50)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(50)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(50)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(50)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(50)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(50)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(50)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(50);
dydt(51)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(50)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(51)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(51);
dydt(52)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(50)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(52)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(52);
dydt(53)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(4)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_2*y(50)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(53)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_2*y(53);
dydt(54)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(5)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_3*y(50)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(54)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_3*y(54);
dydt(55)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(6)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(50)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(55)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(55);
dydt(56)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(6)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(50)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(56)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(56);
dydt(57)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(7)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(50)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(57)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(57);
end