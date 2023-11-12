import pandas as pd
import streamlit as st
from database import get_tables_list, get_col_list, get_data, update_data, get_column

def update():
    tables_list = get_tables_list()
    selected_table = st.selectbox('Select a table to update', tables_list)
    cols = get_col_list(selected_table)
    id_col = get_column(selected_table, cols[0])

    selected_id = st.selectbox('Select an id to update', id_col)
    
    df_temp = pd.DataFrame(get_data(selected_table), columns=cols)
    st.write("DataFrame:", df_temp)  # Add this line to check the DataFrame

    selected_prev_vals = df_temp[df_temp[cols[1]] == selected_id]
    st.write("Selected Previous Values:", selected_prev_vals)  # Add this line to check the selected values
    
    if not selected_prev_vals.empty:
        selected_prev_vals = selected_prev_vals.iloc[0]
        inp_keyval = {}
        
        for i in range(1, len(cols)):
            inp_keyval[cols[i]] = st.text_input(cols[i] + ": ", value=selected_prev_vals[cols[i]])

        if st.button("Update Data"):
            update_data(selected_table, inp_keyval, cols[0], selected_id)
            st.success("Successfully updated the data")
    else:
        st.warning("No data found for the selected ID.")
