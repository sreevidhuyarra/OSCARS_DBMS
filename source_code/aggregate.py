import pymysql
import pymysql.cursors
import common as com


def avg_bud(con, cur):
    try:
        query = "select avg(Budget) as Average_Budget from Movie"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def high_gross(con, cur):
    try:
        query = "select Title, Gross_Income as Highest_Gross_Income from Movie where Gross_Income = (select max(Gross_Income) from Movie)"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def tot_mov(con, cur):
    try:
        query = "select Year, count(*) as No_Of_Movies from Movie group by Year order by Year desc"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def max_mov(con, cur):
    try:
        query = "select count(Wins.Movie_Id) as Max_Awards_Won from Wins, Movie where Wins.Movie_Id = Movie.Movie_Id and Winner = 1 group by Movie.Movie_Id order by Max_Awards_Won desc limit 1"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def max_act(con, cur):
    try:
        query = "select count(Wins.Artist_Id) as Max_Awards_Won from Wins, Artist where Wins.Artist_Id = Artist.Artist_Id and Winner = 1 and Artist_Type = 'Actor' group by Artist.Artist_Id order by Max_Awards_Won desc limit 1"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def drive(con):
    with con.cursor() as cur:
        print("welcome to aggregate!")
        print("we can get the following aggregates for you")
        print("1 - average budget of all the movies")
        print("2 - highest gross income of a movie (in USD)")
        print("3 - total no of movies in each year")
        print("4 - maximum number of awards won by a movie")
        print("5 - maximum number of awards won by an actor")
        print("6 - go back")
        ch = int(input("what is your command? "))
        match ch:
            case 1:
                avg_bud(con, cur)
            case 2:
                high_gross(con, cur)
            case 3:
                tot_mov(con, cur)
            case 4:
                max_mov(con, cur)
            case 5:
                max_act(con, cur)
            case 6:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
