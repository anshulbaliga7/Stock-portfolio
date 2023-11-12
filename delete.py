import pandas as pd
import streamlit as st
from database import get_tables_list, get_col_list, get_data, delete_data
from st_aggrid import GridOptionsBuilder, AgGrid, GridUpdateMode, DataReturnMode
import warnings


def delete():
    tables_list = get_tables_list()
    selected_table = st.selectbox('Select a table to delete', tables_list)
    cols = get_col_list(selected_table)
    data = pd.DataFrame(get_data(selected_table), columns=cols)
    gb = GridOptionsBuilder.from_dataframe(data)
    gb.configure_pagination(paginationAutoPageSize=True)
    gb.configure_side_bar() #Add a sidebar
    gb.configure_selection('multiple', use_checkbox=True, groupSelectsChildren="Group checkbox select children") #Enable multi-row selection
    gridOptions = gb.build()

    grid_response = AgGrid(
        data,
        gridOptions=gridOptions,
        data_return_mode='AS_INPUT',
        update_mode='MODEL_CHANGED',
        fit_columns_on_grid_load=False,
        enable_enterprise_modules=True,
        height=350,
        width='100%',
        reload_data=False
    )

    if st.button("Delete Data"):
        data = grid_response['data']
        selected = grid_response['selected_rows']
        df_temp = pd.DataFrame(selected)[cols[0]]
        delete_data(selected_table, df_temp)
        st.success("Successfully deleted the data")
