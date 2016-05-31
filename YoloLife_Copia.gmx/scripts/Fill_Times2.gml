/// Fill_Times2(level, t1);
var level = argument[0] - 1;
var t1 = argument[1];
ds_grid_add(tiempo_niveles, level, 0, t1);
ds_grid_add(tiempo_niveles, level, 1, t1 + sum);
