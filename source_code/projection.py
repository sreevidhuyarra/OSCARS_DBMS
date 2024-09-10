import pymysql
import pymysql.cursors
import common as com


def win_mov(con, cur):
    try:
        query = "select distinct Title as Movie from Movie, Wins where Movie.Movie_Id = Wins.Movie_Id and Winner = 1"
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def art_mov(con, cur):
    try:
        movie = input("which movie's artists do you want? ")
        query = (
            "(select Name from Artist, Sang, Featured_In, Movie where Artist.Artist_Id = Sang.Artist_Id and Sang.Song_Id = Featured_In.Song_Id and Featured_In.Movie_Id = Movie.Movie_Id and Movie.Title = '%s') union (select Name from Artist, Played, Movie where Artist.Artist_Id = Played.Artist_Id and Movie.Movie_Id = Played.Movie_Id and Title = '%s' order by Name asc) union (select Name from Artist, Movie, Wins where Artist.Artist_Id = Wins.Artist_Id and Movie.Movie_Id = Wins.Movie_Id and Title = '%s')"
            % (movie, movie, movie)
        )
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def song_lang(con, cur):
    try:
        print("you can choose from the following :)")
        query = "select distinct Language from Song"
        ans = com.run(cur, query)
        com.display(ans)
        lang = input("what should be the language of the songs? ")
        query = "select Title, Year_Of_Nomination from Song where Language = '%s'" % (
            lang
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
        print("welcome to projection!")
        print("we can get the following information for you")
        print("1 - list of movies that have won > 0 awards")
        print("2 - list of actors/singers in a particular movie")
        print("3 - list of songs in a prticular language")
        print("4 - go back")
        ch = int(input("what list do you want? "))
        match ch:
            case 1:
                win_mov(con, cur)
            case 2:
                art_mov(con, cur)
            case 3:
                song_lang(con, cur)
            case 4:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
