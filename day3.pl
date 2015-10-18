% sudoku

:- use_module(library(clpfd)).

valid([]).
valid([Head|Tail]) :-
    all_different(Head),
    valid(Tail).

sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    Solution ins 1..4,
    Puzzle = [S11, S12, S13, S14,
              S21, S22, S23, S24,
              S31, S32, S33, S34,
              S41, S42, S43, S44],
    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],
    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S32, S42],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],
    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S31, S32, S41, S42],
    Square4 = [S33, S34, S43, S44],
    valid([Row1, Row2, Row3, Row4,
           Col1, Col2, Col3, Col4,
           Square1, Square2, Square3, Square4]).


%% 8 queens

valid_queen((Row,Col)) :-
    Range = [1,2,3,4,5,6,7,8],
    member(Row, Range),
    member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :-
    valid_queen(Head),
    valid_board(Tail).

rows([],[]).
rows([(Row, _)|QueensTail], [Row|RowsTail]) :-
    rows(QueensTail, RowsTail).

cols([],[]).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :-
    cols(QueensTail, ColsTail).

diags1([],[]).
diags1([(Row,Col)|QueensTail], [Diagonal|DiagonalTail]) :-
    Diagonal is Col - Row,
    diags1(QueensTail, DiagonalTail).

diags2([],[]).
diags2([(Row,Col)|QueensTail], [Diagonal|DiagonalTail]) :-
    Diagonal is Col + Row,
    diags2(QueensTail, DiagonalTail).


eight_queens(Queens) :-
    length(Queens, 8),
    valid_board(Queens),

    rows(Queens, Rows),
    cols(Queens, Cols),
    diags1(Queens, Diags1),
    diags2(Queens, Diags2),
    all_different(Rows),
    all_different(Cols),
    all_different(Diags1),
    all_different(Diags2).
