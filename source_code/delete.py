import pymysql
import pymysql.cursors
import common as com


def movie(con, cur):
    try:
        title = input("title of movie you want to delete: ")
        query = "delete from Movie where Title = '%s'" % (title)
        com.modify(con, cur, query)
        print("deleted successfully :D")
    except Exception as e:
        com.error(con, e)


def song(con, cur):
    try:
        title = input("title of song you want to delete: ")
        query = "delete from Song where Title = '%s'" % (title)
        com.modify(con, cur, query)
        print("deleted successfully :D")
    except Exception as e:
        com.error(con, e)


def drive(con):
    with con.cursor() as cur:
        print("welcome to deletion!")
        print("you can delete the following entity types")
        print("1 - movie")
        print("2 - song")
        print("3 - go back")
        ch = int(input("what do you want to insert? "))
        match ch:
            case 1:
                movie(con, cur)
            case 2:
                song(con, cur)
            case 3:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
