import subprocess as sp
from prettytable import PrettyTable
import pymysql
import pymysql.cursors

yelfore = "\033[38;2;247;228;54m"
blufore = "\033[38;2;108;195;78m"
purfore = "\033[38;2;111;74;108m"
pinfore = "\033[38;2;229;153;157m"

yelback = "\033[48;2;247;228;54m"
bluback = "\033[48;2;108;195;78m"
purback = "\033[48;2;111;74;108m"
pinback = "\033[48;2;229;153;157m"

default = "\x1b[0m"


def clr_screen():
    clr = sp.call("clear", shell=True)


def cont():
    cont = input("press enter to continue")


def display(ans):
    disp = PrettyTable()
    disp.field_names = list(ans[0].keys())
    for row in ans:
        disp.add_row(list(row.values()))
    print(disp)


def error(con, e):
    con.rollback()
    print(e)
    print("sorry, smthn went wrong bro")


def run(cur, query):
    cur.execute(query)
    return cur.fetchall()


def modify(con, cur, query):
    cur.execute(query)
    con.commit()
