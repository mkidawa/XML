#ifndef FUNCTIONS_H_
#define FUNCTIONS_H_
// prototype of every single function used in both main.cpp and project.cpp
void menu();
double Horner (double x,double factor[], int length);
double value (double argument, int f_nr);
void Bisection(int,double,double, double, unsigned int, std::vector<double>&,std::vector<double>&);
void Regula_Falsi(int,double,double, double, unsigned int, std::vector<double>&,std::vector<double>&);
#endif
