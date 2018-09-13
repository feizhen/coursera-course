(* if v1 < v2 then return true *)
fun is_sm (v1: int, v2: int) =
    v1 < v2
(* judge two int is equal *)
fun is_equal (v1: int, v2: int) =
    v1 = v2

(* judge a val is in a list *)
fun is_in_list (va: int, list: int list) =
    if null list
    then false
    else
        if hd list = va
        then true
        else is_in_list(va,tl list)

fun get_date_sum (date: (int*int*int)) =
    (#1 date) * 10000 + (#2 date) * 100 + (#3 date)

(* 1.is_order function, takes two dates and evaluates to true or false *)
(*fun is_older (date1: (int*int*int), date2: (int*int*int)) =
    let
        val year_is_sm = is_sm(#1 date1,#1 date2)
        val year_is_equal = (#1 date1) = (#1 date2)
        val month_is_sm = is_sm(#2 date1,#2 date2)
        val month_is_equal = (#2 date2) = (#2 date2)
        val day_is_sm = is_sm(#3 date1,#3 date2)
    in
        year_is_sm orelse (year_is_equal andalso month_is_sm) orelse
        (year_is_equal andalso month_is_equal andalso day_is_sm)
    end *)

fun is_older (date1: (int*int*int), date2: (int*int*int)) =
    get_date_sum(date1) < get_date_sum(date2)

(* 2.takes a list of dates and a month (i.e., an int) and returns how many dates in the list are in the given month.*)
fun number_in_month (list: (int*int*int) list, month: int) =
    if null list
    then 0
    else
        if (#2 (hd list)) = month (* judge is the target month *)
        then 1 + number_in_month(tl list,month)
        else 0 + number_in_month(tl list,month)


(* 3. *)
fun number_in_months (list: (int*int*int) list, months: int list) =
    if null list
    then 0
    else
        if is_in_list((#2 (hd list)),months) (* judge is in the month list *)
        then 1 + number_in_months(tl list,months)
        else 0 + number_in_months(tl list,months)


(* 4.takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. The returned list should
contain dates in the order they were originally given *)
fun dates_in_month (dates: (int*int*int) list, month: int) =
    if null dates
    then []
    else
        if (#2 (hd dates)) = month
        then hd dates::dates_in_month(tl dates,month)
        else dates_in_month(tl dates,month)

(* 5.takes a list of dates and a list of months (i.e., an int list)
and returns a list holding the dates from the argument list of dates that are in any of the months in
the list of months. Assume the list of months has no number repeated *)
fun dates_in_months (list: (int*int*int) list, months: int list) =
    if null list
    then []
    else
        if is_in_list((#2 (hd list)),months)
        then hd list::dates_in_months(tl list,months)
        else dates_in_months(tl list,months)


(* 6.takes a list of strings and an int n and returns the n
th element of the list where the head of the list is 1st. *)
fun get_nth (list: string list, n: int) =
    if n = 1
    then hd list
    else get_nth(tl list,n-1)

(* 7. *)
fun date_to_string(year: int, month: int, day: int) =
    let
        val year_str = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"]
    in
        get_nth(year_str, month) ^ " " ^ Int.toString(day) ^ "," ^ " " ^ Int.toString(year)
    end

(* 8.Write a function number_before_reaching_sum that takes an int called sum, which you can assume
is positive, and an int list, which you can assume contains all positive numbers, and returns an int.
You should return an int n such that the first n elements of the list add to less than sum, but the first
n + 1 elements of the list add to sum or more. Assume the entire list sums to more than the passed in
value; it is okay for an exception to occur if this is not the case *)
fun number_before_reaching_sum (sum: int, list: int list) =
    if sum > hd list
    then 1 + number_before_reaching_sum(sum - hd list, tl list)
    else 0

(* 9.Write a function what_month that takes a day of year (i.e., an int between 1 and 365) and returns
what month that day is in (1 for January, 2 for February, etc.) *)
fun what_month (num: int) =
    let
        val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    in
        1 + number_before_reaching_sum(num,month_days)
    end

(* 10.Write a function month_range that takes two days of the year day1 and day2 and returns an int list
[m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month
of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2 *)
fun month_range(day1: int, day2: int) =
    if day1 > day2
    then []
    else if day1 = day2
    then what_month(day1)::[]
    else
        what_month(day1)::month_range(day1+1,day2)

(* 11.Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It
evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list *)

fun oldest (dates: (int*int*int) list) =
    if null dates
    then NONE
    else
        let
            fun max_nonempty (xs: (int*int*int) list) =
                if null (tl xs)
                then hd xs
                else
                    let val tl_ans = max_nonempty(tl xs)
                    in
                        if is_older(hd xs,tl_ans)
                        then hd xs
                        else tl_ans
                    end
        in
            SOME (max_nonempty dates)
        end
