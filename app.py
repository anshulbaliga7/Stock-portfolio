import streamlit as st
from create import create
from delete import delete
from read import read
from update import update
from write_sql import write_sql


def main():
    st.title("Stock Portfolio Management System!")
    menu = ["Add", "View", "Edit", "Remove", "Write SQL Code"]
    choice = st.sidebar.selectbox("Menu", menu)
    if choice == "Add":
        st.subheader("Add Data")
        create()
    elif choice == "View":
        st.subheader("View Data")
        read()
    elif choice == "Edit":
        st.subheader("Update Data")
        update()
    elif choice == "Remove":
        st.subheader("Delete Data")
        delete()
    elif choice == "Write SQL Code":
        st.subheader("Write Custom SQL Query")
        write_sql()


if __name__ == '__main__':
    main()
