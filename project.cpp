// ! compile with main.cpp ! //
#include <cmath>
#include <vector>
#include <iomanip>
#include <cstdlib>
#include <iostream>
#include "functions.hpp"
using namespace std;
void menu() // function showing the user what functions are available
{
    cout<<"Wybierz jedna z funkcji: \n";
    cout<<"[1] x^3 + 2x^2 + x - 2\n";
    cout<<"[2] cos(x)\n";
    cout<<"[3] (3^x)-1 \n";
    cout<<"[4] cos(x) + x^3 - 1\n";
}
double Horner (double x,double factor[], int length) // Horner's method calculing polynomials
{
    double aid = factor[0];
    for(int i=1; i<length+1; i++)
    {
        aid = (aid*x)+factor[i];
    }
    return aid;
}
double value (double argument, int f_nr) // calculing value of the function using given argument
{
    double aid = 0;
    double e_aid = 0;
    double a_arr[4]= {1,2,1,-2};
    if(f_nr == 1)
        aid = Horner(argument,a_arr,3);
    else if(f_nr ==2)
    {
        aid = cos(argument);
    }
    else if(f_nr ==3)
    {
        aid = 1;
        if(argument>0 && fmod(argument,1)==0)
        {
            for(int i=0; i<argument; i++)
            {
                aid = aid * 3;
            }
        }
        else if(argument<0 && fmod(argument,1)==0)
        {
           aid = pow(3.0,argument);
        }
        else if(fmod(argument,1)!=0)
        {
            aid = pow(3.0,argument);
        }
        aid = aid-1;
    }
    else if(f_nr ==4)
    {
        aid = (cos(argument) + argument*argument*argument)-1;
    }
    return aid;
}
void Bisection(int option,double range_A,double range_B, double epsilon, unsigned int max_iter_nr, vector<double>&Bi_X,vector<double>&Bi_Y) // function finding roots of the function using the Bisection method
{
    int Bi_iteration = 0;
    double Bi_range_A = range_A;
    double Bi_range_B = range_B;
    double aid_range_Bi = Bi_range_B - Bi_range_A;
    cout<<" \t\t|METODA BISEKCJI| \n";
    Bi_X.push_back((Bi_range_A+Bi_range_B)/2.0);
    Bi_Y.push_back(value(Bi_X[0],option));
    if(Bi_Y[Bi_iteration]!=0)
    {
        while(fabs(Bi_range_A-Bi_range_B)>epsilon && Bi_iteration<max_iter_nr)
        {
            if(Bi_Y[Bi_iteration]*value(Bi_range_A,option)<0)
            {
                Bi_range_B = Bi_X[Bi_iteration];
            }
            else
            {
                Bi_range_A = Bi_X[Bi_iteration];
            }

            Bi_iteration++;
            Bi_X.push_back((Bi_range_A+Bi_range_B)/2.0); //new center
            Bi_Y.push_back(value(Bi_X[Bi_iteration],option));
        }
    }
    cout<<"- Wartosc pierwiastka (przyblizona): "<<setprecision(15)<<Bi_X[Bi_iteration]<<endl;
    cout<<"- Wartosc funkcji w punkcie: "<<setprecision(15)<<Bi_Y[Bi_iteration]<<endl;
    cout.setf(ios::fixed);
    cout<<"- Ilosc iteracji do znalezienia pierwiastka: "<<Bi_iteration<<endl;
}
void Regula_Falsi(int option,double range_A,double range_B, double epsilon, unsigned int iter_nr, vector<double>&Fal_X,vector<double>&Fal_Y) // function finding roots of the function using the False Position method
{
    cout<<" \t\t|REGULA FALSI| \n";
    int Fal_iteration = 0;
    double Fal_range_A = range_A;
    double Fal_range_B = range_B;
    //reminder: vector<double>Fal_X
    //reminder: vector<double>Fal_Y
    Fal_X.push_back((Fal_range_A*value(Fal_range_B,option)-Fal_range_B*value(Fal_range_A,option))/(value(Fal_range_B,option)-value(Fal_range_A,option)));
    Fal_Y.push_back( value(Fal_X[0],option) );
    while(fabs(Fal_Y[Fal_iteration])>epsilon && Fal_iteration<iter_nr)
    {
        if((Fal_Y[Fal_iteration]*value(Fal_range_A,option))<0)
        {
            Fal_range_B = Fal_X[Fal_iteration];
        }
        else
        {
            Fal_range_A = Fal_X[Fal_iteration];
        }
        Fal_X.push_back( (Fal_range_A*value(Fal_range_B,option)-Fal_range_B*value(Fal_range_A,option))/(value(Fal_range_B,option)-value(Fal_range_A,option)) );
        Fal_Y.push_back( value(Fal_X[Fal_iteration],option) );
        Fal_iteration++;
    }
    cout<<"- Wartosc pierwiastka (przyblizona): "<<setprecision(15)<<Fal_X[Fal_iteration]<<endl;
    cout<<"- Wartosc funkcji w punkcie: "<<setprecision(15)<<Fal_Y[Fal_iteration]<<endl;
    cout.setf(ios::fixed);
    cout<<"- Ilosc iteracji do znalezienia pierwiastka: "<<Fal_iteration<<endl;
}
