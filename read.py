import pandas as pd
import streamlit as st
# import plotly.express as px
from database import get_tables_list, get_col_list, get_data


def read():
    tables_list = get_tables_list()

    selected_viewtable = st.selectbox("Table to View : ", tables_list)
    cols = get_col_list(selected_viewtable)
    df = pd.DataFrame(get_data(selected_viewtable), columns=cols)
    st.table(df)