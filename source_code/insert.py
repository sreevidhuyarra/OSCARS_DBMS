import pymysql
import pymysql.cursors
import common as com


def ceremony(con, cur):
    try:
        print("enter the details for the new ceremony")
        year = int(input("year (last 2 digits of 20__): "))
        venue = input("venue: ")
        print("you can choose host from the following :)")
        query = "select Name from Host"
        ans = com.run(cur, query)
        com.display(ans)
        host = input("host: ")
        date = input("date (yyyy-mm-dd): ")
        query = (
            "insert into Ceremony values('%d','%s',(select Host_Id from Host where Name = '%s'),'%s')"
            % (
                year,
                venue,
                host,
                date,
            )
        )
        com.modify(con, cur, query)
        print("inserted successfully :D")
    except Exception as e:
        com.error(con, e)


def movie(con, cur):
    try:
        print("enter the details for the new movie")
        title = input("title: ")
        year = int(input("year (yyyy): "))
        budget = int(input("budget (in USD): "))
        income = int(input("gross income (in USD): "))
        genre = input("genre: ")
        print("you can choose director from the following :)")
        query = "select Artist_Id, Name from Artist natural join Director"
        ans = com.run(cur, query)
        com.display(ans)
        director = input("director: ")
        query = (
            "insert into Movie(Title, Year, Budget, Gross_Income, Genre, Director_Id) values('%s','%d','%d','%d','%s',(select Artist_Id from Artist where Name = '%s'))"
            % (
                title,
                year,
                budget,
                income,
                genre,
                director,
            )
        )
        com.modify(con, cur, query)
        print("inserted successfully :D")
    except Exception as e:
        com.error(con, e)


def song(con, cur):
    try:
        print("enter the details for the new song")
        print("you can choose genre from the following :)")
        query = "select Name from Genre"
        ans = com.run(cur, query)
        com.display(ans)
        genre = input("genre: ")
        title = input("title: ")
        results = input("did they win (y or n): ")
        if results == "y":
            results = "Winner"
        else:
            results = "Nominated"
        year = int(input("year (yyyy): "))
        lang = input("language: ")
        query = (
            "insert into Song(Genre_Id, Title, Results, Year_Of_Nomination, Language) values((select Genre_Id from Genre where Name = '%s'),'%s','%s','%d','%s')"
            % (genre, title, results, year, lang)
        )
        com.modify(con, cur, query)
        print("inserted successfully :D")
    except Exception as e:
        com.error(con, e)


def drive(con):
    with con.cursor() as cur:
        print("welcome to insertion!")
        print("you can insert the following entity types")
        print("1 - ceremony")
        print("2 - movie")
        print("3 - song")
        print("4 - go back")
        ch = int(input("what do you want to insert? "))
        match ch:
            case 1:
                ceremony(con, cur)
            case 2:
                movie(con, cur)
            case 3:
                song(con, cur)
            case 4:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
