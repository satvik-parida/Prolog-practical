% Practical 4
% Query: ?- timetable(Day, Time, Subject, Faculty, Room).

timetable(monday, '09:00', ai, dr_sharma, c101).
timetable(monday, '10:00', dbms, dr_patel, c102).
timetable(tuesday, '09:00', ml, dr_sharma, lab1).
timetable(wednesday, '11:00', ai, dr_sharma, c102).

faculty(Faculty, Day, Time, Subject, Room) :-
    timetable(Day, Time, Subject, Faculty, Room).

classroom(Room, Day, Time, Subject, Faculty) :-
    timetable(Day, Time, Subject, Faculty, Room).
