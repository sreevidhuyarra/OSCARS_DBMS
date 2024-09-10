import pymysql
import pymysql.cursors
import common as com


def income(con, cur):
    try:
        print("enter the details for the changes")
        title = input("movie title: ")
        income = int(input("updated gross income (in USD): "))
        query = "update Movie set Gross_Income = '%d' where Title = '%s'" % (
            income,
            title,
        )
        com.modify(con, cur, query)
        print("updated successfully :D")
    except Exception as e:
        com.error(con, e)


def win_stat(con, cur):
    try:
        print("enter the details for the changes")
        title = input("movie title: ")
        print("you can choose award category from the following :)")
        query = "select Name from Award_Category"
        ans = com.run(cur, query)
        com.display(ans)
        category = input("award category: ")
        result = input("did they win (y or n): ")
        if result == "y":
            result = 1
        else:
            result = 0
        query = (
            "update Wins set Winner = '%d' where Movie_Id = (select Movie_Id from Movie where Title = '%s') and Award_Category_Id = (select Award_Category_Id from Award_Category where Name = '%s')"
            % (result, title, category)
        )
        com.modify(con, cur, query)
        print("updated successfully :D")
    except Exception as e:
        com.error(con, e)


def drive(con):
    with con.cursor() as cur:
        print("welcome to updation!")
        print("you can update the following attributes")
        print("1 - gross income of a movie")
        print("2 - win status of a movie")
        print("3 - go back")
        ch = int(input("what do you want to insert? "))
        match ch:
            case 1:
                income(con, cur)
            case 2:
                win_stat(con, cur)
            case 3:
                return 0
            case _:
                print("sorry, that is not a valid option")
    return 1
