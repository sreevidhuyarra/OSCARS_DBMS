import pymysql
import pymysql.cursors
import common as com


def cat_of_mov(con, cur):
    try:
        movie = input("which movie would you like to know about? ")
        query = (
            "select Name as Category, Year from Award_Category, Wins, Movie where Movie.Movie_Id = Wins.Movie_Id and Wins.Award_Category_Id = Award_Category.Award_Category_Id and Title = '%s'"
            % (movie)
        )
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def mov_with_gross(con, cur):
    try:
        gross = int(input("what is the minimum gross amount(in USD)? "))
        query = (
            "select Title, Gross_Income from Movie where Gross_Income >= '%d' order by Gross_Income asc"
            % (gross)
        )
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def mov_in_cat(con, cur):
    try:
        print("you can choose from the following :)")
        query = "select Name from Award_Category"
        ans = com.run(cur, query)
        com.display(ans)
        category = input("which category would you like to know about? ")
        query = (
            "select Title, Year from Movie, Award_Category, Wins where Movie.Movie_Id = Wins.Movie_Id and Wins.Award_Category_Id = Award_Category.Award_Category_Id and Winner = 1 and Name = '%s'"
            % (category)
        )
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def cer_in_ven(con, cur):
    try:
        print("you can choose from the following :)")
        query = "select distinct Venue from Ceremony"
        ans = com.run(cur, query)
        com.display(ans)
        venue = input("what is the venue of the ceremonies? ")
        query = (
            "select Year, Date, Name from Ceremony natural join Host where Venue = '%s' order by Year desc"
            % (venue)
        )
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def drive(con):
    with con.cursor() as cur:
        print("welcome to selection!")
        print("we can get the following information for you")
        print("1 - select list of categories a particular movie has been nominated to")
        print(
            "2 - select list of all movies grossing more than a particular amount (in USD)"
        )
        print(
            "3 - select list of movies that have won an award in a particular category"
        )
        print("4 - select list of years ceremony was hosted at a particular venue")
        print("5 - go back")
        ch = int(input("what is your command? "))
        match ch:
            case 1:
                cat_of_mov(con, cur)
            case 2:
                mov_with_gross(con, cur)
            case 3:
                mov_in_cat(con, cur)
            case 4:
                cer_in_ven(con, cur)
            case 5:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
