:- module(tellep_tests, []).

/** <module> TELLEP: Automated tests

This module runs a couple of tests against TELLEP, in order to check
whether its behavior is still A-OK.

@author Wouter Beek
@version 2017/10
*/

:- use_module(library(apply)).
:- use_module(library(plunit)).
:- use_module(tellep).


:- begin_tests(tellep).

test(test1, [fail]) :-
  call(socrates :: human and not human).

test(test2, [setup(assert(subClassOf(human,animal))),
             cleanup(retractall(subClassOf(human,animal)))]) :-
  maplist(call, [
    socrates :: human
  ]).

test(test3, [setup(assert(subClassOf(human,not animal))),
             cleanup(retractall(subClassOf(human,not animal)))]) :-
  maplist(call, [
    artis :: inhabitant only animal,
    artis :: inhabitant some human
  ]).

:- end_tests(tellep).
