import streamlit as st
import pandas as pd
from database import add_data, get_tables_list, get_col_list, get_data


def create():
    tables_list = get_tables_list()

    with st.expander("Viewing the Database"):
        selected_viewtable = st.selectbox("Select the table to view: " , tables_list)
        cols = get_col_list(selected_viewtable)
        df = pd.DataFrame(get_data(selected_viewtable), columns=cols)
        st.table(df)

    selected_table = st.selectbox("Select a table to add data to", tables_list)

    col_list = get_col_list(selected_table)
    inp_keyval = {}
    for i in range(len(col_list)):
        inp_keyval[col_list[i]] = st.text_input(col_list[i] + ": ")

    if st.button("Add Data"):
        # add_data(selected_table, ('RBL', 'RBL Bank', 'Banking', 123456789, 123456789))
        for key in inp_keyval:
            temp = inp_keyval[key]
            try:
                temp2 = int(temp)
                inp_keyval[key] = temp2
            except Exception:
                #inp_keyval[key] = "'" + temp + "'"
                inp_keyval[key] = temp

        add_data(selected_table, inp_keyval)
        st.success("Successfully added the data")
