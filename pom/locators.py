#List Users Page Elements
btn_new_user='xpath://div[@id="toolbar"]/a[1]'
btn_edit_user='xpath://div[@id="toolbar"]/a[2]'
btn_remove_user='xpath://div[@id="toolbar"]/a[3]'
select_pagination='xpath://select[@class="pagination-page-list"]'
btn_pagination_first='xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[4]'
btn_pagination_prev='xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[5]'
btn_pagination_next='xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[6]'
btn_pagination_last='xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[7]'
btn_pagination_load='xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[8]'

input_pagination='xpath://input[@class="pagination-num"]'
list_users='xpath://tr[contains(@id, "dg_datagrid-row-r1-2-")]'

firstname_list_user='xpath:(//tr[contains(@id, "dg_datagrid-row-r1-2-")]/td[1]/div)'
lastname_list_user='xpath:(//tr[contains(@id, "dg_datagrid-row-r1-2-")]/td[2]/div)'

#Cadastro/Edicao Users Page Elements
input_first_name='css:#_easyui_textbox_input1'
input_last_name='css:#_easyui_textbox_input2'
input_phone='css:#_easyui_textbox_input3'
input_email='css:#_easyui_textbox_input4'
btn_save='xpath://div[@id="dlg-buttons"]/a[1]'
btn_cancel_add_user='xpath://div[@id="dlg-buttons"]/a[2]'

#Remocao User Page Elements
btn_ok='xpath://div[@class="dialog-button messager-button"]/a[1]'
btn_cancel='xpath://div[@class="dialog-button messager-button"]/a[2]'