import pymysql
import pymysql.cursors
import common as com


def gend_gross(con, cur):
    try:
        query = "select Title as Movie, Name as Director, Gross_Income, Gender from Movie join Director on Movie.Director_Id = Director.Artist_Id join Artist on Artist.Artist_Id = Movie.Director_Id order by Gross_Income desc"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def age_gend(con, cur):
    try:
        query = "select Title as Movie, Artist.Name as Actor, Year- Year_Of_Birth as Actor_Age, Age as Character_Age, Character_Table.Gender from Played join Movie on Movie.Movie_Id = Played.Movie_Id join Artist on Artist.Artist_Id = Played.Artist_Id join Actor on Actor.Artist_Id = Played.Artist_Id join Character_Table on Character_Table.Character_Id = Played.Character_Id"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def num_gend(con, cur):
    try:
        query = "select count(*) as No_Of_Movies_Directed, Name as Director, Gender from Movie join Director on Movie.Director_Id = Director.Artist_Id join Artist on Artist.Artist_Id = Movie.Director_Id group by Director_Id order by No_Of_Movies_Directed desc"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def drive(con):
    with con.cursor() as cur:
        print("welcome to analysis!")
        print("we can give the following analysis")
        print(
            "1 - relationship between the gender of the director and the gross income of the movies"
        )
        print(
            "2 - closeness of age of actor to the age of the character and its dependency on the gender of the actor"
        )
        print(
            "3 - relationship between number of movies directed and the gender of the director"
        )
        print("4 - go back")
        ch = int(input("what analysis do you want? "))
        match ch:
            case 1:
                gend_gross(con, cur)
            case 2:
                age_gend(con, cur)
            case 3:
                num_gend(con, cur)
            case 4:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
