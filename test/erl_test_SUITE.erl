
-module(erl_test_SUITE).

-include_lib("common_test/include/ct.hrl").

%% ct
-export([all/0]).
-export([groups/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export([init_per_group/2]).
-export([end_per_group/2]).
-export([init_per_testcase/2]).
-export([end_per_testcase/2]).

-export([erl_test_first01/1]).
-export([erl_test_first02/1]).
-export([erl_test_second/1]).
-export([erl_test_third/1]).

all() ->
    [{group, first}, {group, second}, erl_test_third].

groups() ->
    [{first, [erl_test_first01, erl_test_first02]},
     {second, [erl_test_second]}].

init_per_suite(Config) ->
    [{init_per_suite, true} | Config].

end_per_suite(_) ->
    ok.

init_per_group(_Group, Config) ->
    [{init_per_group, true} | Config].

end_per_group(_Group, _Config) ->
    ok.

init_per_testcase(_Group, Config) ->
    [{init_per_testcase, true} | Config].

end_per_testcase(_Group, _Config) ->
    ok.

erl_test_first01(Config) ->
    true = ?config(init_per_suite, Config),
    true = ?config(init_per_group, Config),
    true = ?config(init_per_testcase, Config),
    ok.

erl_test_first02(Config) ->
    true = ?config(init_per_suite, Config),
    true = ?config(init_per_group, Config),
    true = ?config(init_per_testcase, Config),
    ok.

erl_test_second(Config) ->
    true = ?config(init_per_suite, Config),
    true = ?config(init_per_group, Config),
    true = ?config(init_per_testcase, Config),
    ok.

erl_test_third(Config) ->
    true = ?config(init_per_suite, Config),
    undefined = ?config(init_per_group, Config),
    true = ?config(init_per_testcase, Config),
    ok.






