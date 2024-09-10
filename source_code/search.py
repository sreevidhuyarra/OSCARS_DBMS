import pymysql
import pymysql.cursors
import common as com


def artist(con, cur):
    try:
        artist = input("who's the artist? ")
        query = "select * from Artist where Name = '%s'" % (artist)
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def category(con, cur):
    try:
        category = input("what's the category? ")
        query = "select * from Award_Category where Name = '%s'" % (category)
        ans = com.run(cur, query)
        if not ans:
            print("sorry, nothing to see here :(")
            return
        com.display(ans)
    except Exception as e:
        com.error(con, e)


def drive(con):
    with con.cursor() as cur:
        print("welcome to search!")
        print("we can search up the following")
        print("1 - artist")
        print("2 - award category")
        print("3 - go back")
        ch = int(input("what are you looking for? "))
        match ch:
            case 1:
                artist(con, cur)
            case 2:
                category(con, cur)
            case 3:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
