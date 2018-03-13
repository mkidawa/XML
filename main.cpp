//// Metody Numeryczne i Optymalizacja - Zadanie 1 Metoda Bisekcji i Regula Falsi
//// Autorzy:
//// Stanislaw Kozera - 216810
//// Jan Kozera - 216809
//// Michal Kidawa - 216796
#include <cmath>
#include <vector>
#include <iomanip>
#include <cstdlib>
#include <iostream>
#include "functions.hpp"
#include "gnuplot_i.hpp"
#define GNUPLOT_PATH "C:\\gnuplot\\bin"
using namespace std;
int main()
{
    Gnuplot::set_GNUPlotPath( GNUPLOT_PATH );
    Gnuplot main_plot;
    main_plot.set_title( "Wykres" );
    main_plot.set_xlabel( "Os X" );
    main_plot.set_ylabel( "Os Y" );
    main_plot.set_grid();
    double range_A,range_B; // range
    double epsilon;
    int iter_nr;
    int option; // choice of function determined by user
    int pivot = 0; // aid variable (will be used to determine wheter to relaunch the algorithm or not)
    int stop_c; // criterion of stop within the algorithm
    while(pivot == 0)
    {
        system("cls");
        menu();
        cin>>option;
        while(option>4 || option<1)
        {
            cout<<"Niepoprawny wybor opcji. Dokonaj wyboru jeszcze raz \n";
            cin>>option;
        }
        cout<<"Podaj przedzial w ktorym beda liczone miejsca zerowe \n"<<"Od: ";
        cin>>range_A;
        cout<<"Do: ";
        cin>>range_B;
        while(value(range_A,option)*value(range_B,option)>=0) //checking wheter the sign of function is less than zero
        {
            cout<<"Wprowadz zakres jeszcze raz! \n";
            cin>>range_A;
            cin>>range_B;
        }
        cout<<"Jakie jest kryterium zatrzymania algorytmu? \n";
        cout<<"1) Zadana dokladnosc obliczen osiagnieta przez program \n"<<"2) Wykonanie podanej liczby iteracji \n";
        cin>>stop_c; //criterion of stop
        unsigned int iter_nr = UINT_MAX; // if nr of iterations will not be selected as a stop criterion, then the algorithm will proceed as many times, as the integer can allow to
        epsilon=0.000000000000000001;
        if(stop_c == 1)
        {
            cout<<"Prosze podac dokladnosc: \n";
            cin>>epsilon;
        }
        else if(stop_c==2)
        {
            cout<<"Prosze podac ilosc iteracji: \n";
            cin>>iter_nr;
        }
        vector<double>Bi_X; // vector used to store arguments of roots during the Bisection Method
        vector<double>Bi_Y; // vector used to store value of roots during the Bisection Method
        vector<double>Fal_X; // vector used to store arguments of roots during the False position Method
        vector<double>Fal_Y; // vector used to store value of roots during during the False position Method
        vector<double>res_X;
        vector<double>res_Y;
        main_plot.set_style( "lines" );
        main_plot.set_xrange(range_A,range_B);
        if(option==1)
        {

            for(double i=range_A; i<=range_B; i+=0.1)
            {
                res_X.push_back(i);
                res_Y.push_back(value(i,option));
            }
            main_plot.plot_xy(res_X,res_Y,"x^3 + 2x^2 + x - 2");
            res_X.clear();
            res_Y.clear();
        }
        else if(option==2)
        {
            for(double i=range_A; i<=range_B; i+=0.1)
            {
                res_X.push_back(i);
                res_Y.push_back(value(i,option));
            }
            main_plot.plot_xy(res_X,res_Y,"cos(x)");
            res_X.clear();
            res_Y.clear();
        }
        else if(option==3)
        {
            for(double i=range_A; i<=range_B; i+=0.1)
            {
                res_X.push_back(i);
                res_Y.push_back(value(i,option));
            }
            main_plot.plot_xy(res_X,res_Y,"3^x-1");
            res_X.clear();
            res_Y.clear();
        }
        else if(option==4)
        {
            for(double i=range_A; i<=range_B; i+=0.1)
            {
                res_X.push_back(i);
                res_Y.push_back(value(i,option));
            }
            main_plot.plot_xy(res_X,res_Y,"cos(x) + x^3 - 1");
            res_X.clear();
            res_Y.clear();
        }
        //Plotting the Bisection Method
        Bisection(option,range_A,range_B,epsilon,iter_nr,Bi_X,Bi_Y);
        main_plot.set_style( "points" );
        main_plot.set_xrange( range_A, range_B );
        main_plot.set_pointsize( 3.0 );
        main_plot.plot_xy(Bi_X,Bi_Y,"Bisekcja: kolejne kroki");
        int bix = Bi_X.size()-1;
        int biy = Bi_Y.size()-1;
        vector<double>w_Bix;
        vector<double>w_Biy;
        w_Bix.push_back(Bi_X[bix]);
        w_Biy.push_back(Bi_Y[biy]);
        main_plot.set_style( "points" );
        main_plot.set_xrange( range_A, range_B );
        main_plot.set_pointsize( 3.0 );
        main_plot.plot_xy(w_Bix,w_Biy,"Bisekcja: pierwiastek");
        ;
        //Plotting the False Position Method
        Regula_Falsi(option,range_A,range_B,epsilon,iter_nr,Fal_X,Fal_Y);
        main_plot.set_style( "points" );
        main_plot.set_xrange( range_A, range_B );
        main_plot.set_pointsize( 3.0 );
        main_plot.plot_xy(Fal_X,Fal_Y,"Regula Falsi: kolejne kroki");
        int fix = Fal_X.size()-1;
        int fiy = Fal_Y.size()-1;
        vector<double>w_Fix;
        vector<double>w_Fiy;
        w_Fix.push_back(Fal_X[fix]);
        w_Fiy.push_back(Fal_Y[fiy]);
        main_plot.set_style( "points" );
        main_plot.set_xrange( range_A, range_B );
        main_plot.set_pointsize( 3.0 );
        main_plot.plot_xy(w_Fix,w_Fiy,"Bisekcja: pierwiastek");
        char repeat;
        cout<<"Powtorzyc dzialanie programu? [t|n] \n";
        cin>>repeat;
        if (repeat == 't')
            pivot = 0;
        else pivot = 1;

    }
    return 0;
}
