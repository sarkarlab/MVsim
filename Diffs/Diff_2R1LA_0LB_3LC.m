function dydt = Diff_2R1LA_0LB_3LC(t,y, app) 

L1 = app.Parameters.SPR.LtempL1;
L2 = app.Parameters.SPR.LtempL2;
L3 = app.Parameters.SPR.LtempL3;
Kons = app.Parameters.Kons;
Koffs = app.Parameters.Koffs;
EffCs = app.Parameters.EffCs;

dydt = zeros(31,1);
dydt(1)=+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(2)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(3)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(4)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(5)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(6)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(11)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(18)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(25)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(1)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(1)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(1);
dydt(2)=+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(7)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(12)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(19)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(26)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(2)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(2);
dydt(3)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(8)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(15)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(20)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(22)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(27)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(29)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(3)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(3)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(3);
dydt(4)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(9)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(13)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(16)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(23)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(28)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(30)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(4)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(4)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(4)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(4)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(4)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(4)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(4);
dydt(5)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(10)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(14)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(17)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(21)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(24)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(31)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(5)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(5)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(5)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(5)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(5)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(5)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(5);
dydt(6)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(7)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(8)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(9)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(10)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(6)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(6)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(6)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(6)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(6);
dydt(7)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(6)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(7)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(7);
dydt(8)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(3)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(6)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(8)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(8);
dydt(9)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(4)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(6)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(9)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(9);
dydt(10)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(5)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(6)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(10)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(10);
dydt(11)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(12)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(13)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(14)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(15)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(16)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(17)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(11)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(11)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(11)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(11)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(11)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(11)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(11);
dydt(12)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(11)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(12)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(12);
dydt(13)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(4)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(11)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(13)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(13);
dydt(14)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(5)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(11)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(14)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(14);
dydt(15)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(11)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(15)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(15);
dydt(16)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(4)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(11)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(16)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(16);
dydt(17)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(5)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(11)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(17)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(17);
dydt(18)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(19)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(20)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(21)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(22)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(23)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(24)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(18)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(18)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(18)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(18)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(18)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(18)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(18);
dydt(19)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(18)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(19)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(19);
dydt(20)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(3)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(18)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(20)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(20);
dydt(21)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(5)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(18)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(21)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(21);
dydt(22)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(3)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(18)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(22)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(22);
dydt(23)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(4)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(18)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(23)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(23);
dydt(24)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(5)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(18)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(24)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(24);
dydt(25)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(26)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(27)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(28)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(29)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(30)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(31)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(25)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(25)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(25)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(25)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(25)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(25)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(25);
dydt(26)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(25)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(26)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(26);
dydt(27)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(3)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to3_0*y(25)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(27)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(27);
dydt(28)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(4)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0*y(25)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(28)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(28);
dydt(29)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(3)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(25)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(29)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(29);
dydt(30)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(4)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(25)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(30)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(30);
dydt(31)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_3*y(5)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_3*y(25)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_3*y(31)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_3*y(31);
end