# Account Financial Report
## General Ledger  
### Replace Layout  
ID: `mint_system.account_financial_report.general_ledger.replace_layout`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.general_ledger" priority="50">

    <xpath expr="//t[@t-call='account_financial_report.internal_layout']" position="attributes">        
        <attribute name="t-call">account_financial_report.internal_layout_trimada</attribute>        
    </xpath>

</data>
```
Source: [snippets/account_financial_report.general_ledger.replace_layout.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.general_ledger.replace_layout.xml)

## Internal Layout  
### Style Trimada  
ID: `mint_system.account_financial_report.internal_layout.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.internal_layout" priority="60">

    <xpath expr="//link" position="replace">

        <style>
            .act_as_table {
                display: table !important;
                background-color: white;
            }
            .act_as_row {
                display: table-row !important;
                page-break-inside: avoid;
            }
            .act_as_cell {
                display: table-cell !important;
                page-break-inside: avoid;
            }
            .act_as_thead {
                display: table-header-group !important;
            }
            .act_as_tbody {
                display: table-row-group !important;
            }
            .list_table,
            .data_table,
            .totals_table {
                width: 100% !important;
            }
            .act_as_row.labels {
                background-color: #f0f0f0 !important;
            }
            .list_table,
            .data_table,
            .totals_table,
            .list_table .act_as_row {
                border-left: 0px;
                border-right: 0px;
                text-align: center;
                font-size: 10px;
                padding-right: 3px;
                padding-left: 3px;
                padding-top: 2px;
                padding-bottom: 2px;
                border-collapse: collapse;
            }
            .totals_table {
                font-weight: bold;
                text-align: center;
            }
            .list_table .act_as_row.labels,
            .list_table .act_as_row.initial_balance,
            .list_table .act_as_row.lines {
                border-color: grey !important;
                border-bottom: 1px solid lightGrey !important;
            }
            .data_table .act_as_cell {
                border: 1px solid lightGrey;
                text-align: center;
            }
            .data_table .act_as_cell,
            .list_table .act_as_cell,
            .totals_table .act_as_cell {
                word-wrap: break-word;
            }
            .data_table .act_as_row.labels,
            .totals_table .act_as_row.labels {
                font-weight: bold;
            }
            .initial_balance .act_as_cell {
                font-style: italic;
            }
            .account_title {
                font-size: 11px;
                font-weight: bold;
            }
            .account_title.labels {
                background-color: #f0f0f0 !important;
            }
            .act_as_cell.amount {
                word-wrap: normal;
                text-align: right;
            }
            .act_as_cell.left {
                text-align: left;
            }
            .act_as_cell.right {
                text-align: right;
            }
            /*.list_table .act_as_cell {*/
            /*    border-right:1px solid lightGrey;  uncomment to active column lines */
            /*}*/
            .list_table .act_as_cell.first_column {
                padding-left: 0px;
                /*    border-left:1px solid lightGrey; uncomment to active column lines */
            }
            .overflow_ellipsis {
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
            }
            .custom_footer {
                font-size: 7px !important;
            }
            .page_break {
                page-break-inside: avoid;
            }

            .button_row {
                padding-bottom: 10px;
            }

            .o_account_financial_reports_page {
                padding-top: 10px;
                width: 90%;
                margin-right: auto;
                margin-left: auto;
                font-family: Helvetica, Arial;
            }
        </style>

    </xpath>
</data>
```
Source: [snippets/account_financial_report.internal_layout.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.internal_layout.style_trimada.xml)

### Trimada  
ID: `mint_system.account_financial_report.internal_layout.trimada`  
```xml
<?xml version="1.0"?>
<t t-name="account_financial_report.internal_layout">

    <t t-if="not o" t-set="o" t-value="doc"/>

    <t t-if="not company">
        <!-- Multicompany -->
        <t t-if="company_id">
            <t t-set="company" t-value="company_id"/>
        </t>
        <t t-elif="o and 'company_id' in o and o.company_id.sudo()">
            <t t-set="company" t-value="o.company_id.sudo()"/>
        </t>
        <t t-else="else">
            <t t-set="company" t-value="res_company"/>
        </t>
    </t>

    <div class="header">
        <div class="row" style="height: 20px;">
            <div class="col-3">
                <span t-esc="context_timestamp(datetime.datetime.now()).strftime('%Y-%m-%d')"/>
            </div>
            <div class="col-2 offset-2 text-center">
                <span t-esc="company_name"/>
            </div>
            <div class="col-2 offset-3 text-right">
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <span class="page"/>
                    </li>
                    <li class="list-inline-item">/</li>
                    <li class="list-inline-item">
                        <span class="topage"/>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="article o_account_financial_reports_page">

        <style>
            .act_as_table {
                display: table !important;
                background-color: white;
            }
            .act_as_row {
                display: table-row !important;
                page-break-inside: avoid;
            }
            .act_as_cell {
                display: table-cell !important;
                page-break-inside: avoid;
                
                padding: 3px;
                border-style: none none solid none !important;            
            }
            .act_as_thead {
                display: table-header-group !important;
            }
            .act_as_tbody {
                display: table-row-group !important;
            }
            .list_table,
            .data_table,
            .totals_table {
                width: 100% !important;
            }
            .act_as_row.labels {
                background-color: #f0f0f0 !important;
            }
            .list_table,
            .data_table,
            .totals_table,
            .list_table .act_as_row {
                border-left: 0px;
                border-right: 0px;
                text-align: center;        
                font-size: 12px;                
                padding-right: 3px;
                padding-left: 3px;
                padding-top: 2px;
                padding-bottom: 2px;
                border-collapse: collapse;
            }
            .totals_table {
                font-weight: bold;
                text-align: center;
            }
            .list_table .act_as_row.labels,
            .list_table .act_as_row.initial_balance,
            .list_table .act_as_row.lines {
                border-color: grey !important;
                border-bottom: 1px solid lightGrey !important;
            }
            .data_table .act_as_cell {
                border: 1px solid lightGrey;
                text-align: center;
            }
            .data_table .act_as_cell,
            .list_table .act_as_cell,
            .totals_table .act_as_cell {
                word-wrap: break-word;
            }
            .data_table .act_as_row.labels,
            .totals_table .act_as_row.labels {
                font-weight: bold;
            }
            .initial_balance .act_as_cell {
                font-style: italic;
            }
            .account_title {                          
                font-size: 16px;                
                font-weight: bold;
            }
            .account_title.labels {
                background-color: #f0f0f0 !important;
            }
            .act_as_cell.amount {
                word-wrap: normal;
                text-align: right;
            }
            .act_as_cell.left {
                text-align: left;
            }
            .act_as_cell.right {
                text-align: right;
            }
            /*.list_table .act_as_cell {*/
            /*    border-right:1px solid lightGrey;  uncomment to active column lines */
            /*}*/
            .list_table .act_as_cell.first_column {
                padding-left: 0px;
                /*    border-left:1px solid lightGrey; uncomment to active column lines */
            }
            .overflow_ellipsis {
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
            }
            .custom_footer {
                font-size: 7px !important;
            }
            .page_break {
                page-break-inside: avoid;
            }

            .button_row {
                padding-bottom: 10px;
            }

            .o_account_financial_reports_page {
                padding-top: 10px;
                width: 100%;
                margin-right: 0px;
                margin-left: 0px;
                font-family: Helvetica, Arial;
            }
            .title {
              font-weight: bold;
            }
        </style>

        <t t-raw="0"/>
    </div>
</t>
```
Source: [snippets/account_financial_report.internal_layout.trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.internal_layout.trimada.xml)

## Report General Ledger Base  
### Hide Filters  
ID: `mint_system.account_financial_report.report_general_ledger_base.hide_filters`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.report_general_ledger_base" priority="50">

    <xpath expr="//t[@t-call='account_financial_report.report_general_ledger_filters']" position="replace"/>

</data>
```
Source: [snippets/account_financial_report.report_general_ledger_base.hide_filters.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.report_general_ledger_base.hide_filters.xml)

### Replace Title  
ID: `mint_system.account_financial_report.report_general_ledger_base.replace_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.report_general_ledger_base" priority="50">

    <xpath expr="//h4/.." position="replace">
        <div class="title">Kontoauszug vom <span t-esc="date_from" t-options='{"widget": "date"}' />
            bis <span t-esc="date_to" t-options='{"widget": "date"}' />
        </div>
    </xpath>

</data>
```
Source: [snippets/account_financial_report.report_general_ledger_base.replace_title.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.report_general_ledger_base.replace_title.xml)

## Report General Ledger Ending Cumul  
### Hide  
ID: `mint_system.account_financial_report.report_general_ledger_ending_cumul.hide`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.report_general_ledger_ending_cumul" priority="50">

    <xpath expr="//div[@class='act_as_row labels']" position="replace"/>
    
</data>
```
Source: [snippets/account_financial_report.report_general_ledger_ending_cumul.hide.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.report_general_ledger_ending_cumul.hide.xml)

## Report General Ledger Lines  
### Initial Balance And Cumulated  
ID: `mint_system.account_financial_report.report_general_ledger_lines.initial_balance_and_cumulated`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.report_general_ledger_lines" priority="50">

    <xpath expr="//div/div[@class='act_as_row lines']" position="replace">

        <div class="act_as_row lines" style="font-style: italic">

            <!--## col1 -->
            <div class="act_as_cell"/>
            <!--## col2 -->
            <div class="act_as_cell"/>
            <!--## col3-->
            <div class="act_as_cell left">Anfangssaldo
            </div>

            <!--## matching_number-->
            <t t-set="misc_domain" t-value="[('account_id', '=', account['id']),('date', '&lt;', date_from)]"/>
            <t t-set="misc_grouped_domain" t-value="[('partner_id', '=', account_or_group_item_object['id'])]" t-if="'partners' in account"/>
            <t t-set="misc_grouped_domain" t-value="[]" t-else=""/>

            <!--## debit-->
            <div class="act_as_cell amount">
                <t t-set="debit_domain" t-value="[('debit', '&lt;&gt;', 0)]"/>
                <t t-if="type == 'account_type'">
                    <span t-att-domain="misc_domain+debit_domain" res-model="account.move.line">
                        <t t-raw="account_or_group_item_object['init_bal']['debit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
                <t t-if="type == 'grouped_type'">
                    <span t-att-domain="misc_domain+debit_domain+misc_grouped_domain" res-model="account.move.line">
                        <t t-raw="account_or_group_item_object['init_bal']['debit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
            </div>

            <!--## credit-->
            <div class="act_as_cell amount">
                <t t-set="credit_domain" t-value="[('credit', '&lt;&gt;', 0)]"/>
                <t t-if="type == 'account_type'">
                    <span t-att-domain="misc_domain+credit_domain" res-model="account.move.line">
                        <t t-raw="account_or_group_item_object['init_bal']['credit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
                <t t-if="type == 'grouped_type'">
                    <span t-att-domain="misc_domain+credit_domain+misc_grouped_domain" res-model="account.move.line">
                        <t t-raw="account_or_group_item_object['init_bal']['credit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
            </div>

            <!--## balance cumulated-->
            <div class="act_as_cell amount">
                <t t-if="type == 'account_type'">
                    <span t-att-domain="misc_domain" res-model="account.move.line">
                        <t t-raw="account_or_group_item_object['init_bal']['balance']" t-options="{'widget': 'monetary', 'display_currency': company_currency}"/>
                    </span>
                </t>
                <t t-if="type == 'grouped_type'">
                    <span t-att-domain="misc_domain+misc_grouped_domain" res-model="account.move.line">
                        <t t-raw="account_or_group_item_object['init_bal']['balance']" t-options="{'widget': 'monetary', 'display_currency': company_currency}"/>
                    </span>
                </t>
            </div>
            <t t-if="foreign_currency">
                <t t-if="account['currency_id']">
                    <div class="act_as_cell amount" style="width: 3.63%;">
                        <t t-if="type == 'account_type'">
                            <span t-att-domain="misc_domain" res-model="account.move.line">
                                <t t-raw="account_or_group_item_object['init_bal']['bal_curr']" t-options="{'widget': 'float', 'precision': 2}"/>
                            </span>
                        </t>
                        <t t-if="type == 'grouped_type'">
                            <span t-att-domain="misc_domain+misc_grouped_domain" res-model="account.move.line">
                                <t t-raw="account_or_group_item_object['init_bal']['bal_curr']" t-options="{'widget': 'float', 'precision': 2}"/>
                            </span>
                        </t>
                    </div>
                    <div class="act_as_cell amount" style="width: 3.63%;">
                        <t t-if="type == 'account_type'">
                            <span t-att-domain="misc_domain" res-model="account.move.line">
                                <t t-raw="account_or_group_item_object['init_bal']['bal_curr']" t-options="{'widget': 'monetary', 'display_currency': account['currency_id']}"/>
                            </span>
                        </t>
                        <t t-if="type == 'grouped_type'">
                            <span t-att-domain="misc_domain+misc_grouped_domain" res-model="account.move.line">
                                <t t-raw="account_or_group_item_object['init_bal']['bal_curr']" t-options="{'widget': 'monetary', 'display_currency': account['currency_id']}"/>
                            </span>
                        </t>
                    </div>
                </t>
                <t t-if="not account['currency_id']">
                    <div class="act_as_cell" style="width: 3.63%;"/>
                    <div class="act_as_cell" style="width: 3.63%;"/>
                </t>
            </t>
        </div>

        <!--## col1-->
        <div class="act_as_cell">
        </div>
        <!--## col2-->
        <div class="act_as_cell">
        </div>
        <!--## col2-->
        <div class="act_as_cell left" style="font-weight: bold">Endsaldo
        </div>        

        <!--## debit-->
        <div class="act_as_cell trimada amount" style="width: 8.89%; font-weight: bold">
            <span t-esc="account_or_group_item_object['fin_bal']['debit']" t-options="{'widget': 'float', 'precision': 2}"/>
        </div>

        <!--## credit-->
        <div class="act_as_cell trimada amount" style="width: 8.89%; font-weight: bold">
            <span t-esc="account_or_group_item_object['fin_bal']['credit']" t-options="{'widget': 'float', 'precision': 2}"/>
        </div>

        <!--## balance cumulated-->
        <div class="act_as_cell trimada amount" style="width: 8.89%; font-weight: bold">
            <span t-esc="account_or_group_item_object['fin_bal']['balance']" t-options="{'widget': 'monetary', 'display_currency': company_currency}"/>
        </div>
        
        <!--## currency_name + amount_currency-->
        <t t-set="misc_domain" t-value="[('account_id', '=', account['id']),('date', '&lt;', date_from)]"/>
        <t t-set="misc_grouped_domain" t-value="[('partner_id', '=', account_or_group_item_object['id'])]" t-if="'partners' in account"/>
        <t t-set="misc_grouped_domain" t-value="[]" t-else=""/>
        <t t-if="foreign_currency">
            <t t-if="account['currency_id']">
                <div class="act_as_cell trimada amount" style="width: 3.63%; font-weight: bold">
                    <t t-if="type == 'account_type'">
                        <span>
                            <a t-att-data-t-att-domain="misc_domain" t-att-data-res-model="'account.move.line'" class="o_account_financial_reports_web_action_monetary_multi" style="color: black;">
                                <t t-raw="account_or_group_item_object['fin_bal']['bal_curr']" t-options="{'widget': 'float', 'precision': 2}"/>
                            </a>
                        </span>
                    </t>
                    <t t-if="type == 'grouped_type'">
                        <span>
                            <a t-att-data-t-att-domain="misc_domain+misc_grouped_domain" t-att-data-res-model="'account.move.line'" class="o_account_financial_reports_web_action_monetary_multi" style="color: black;">
                                <t t-raw="account_or_group_item_object['fin_bal']['bal_curr']" t-options="{'widget': 'float', 'precision': 2}"/>
                            </a>
                        </span>
                    </t>
                </div>
                <div class="act_as_cell trimada amount" style="width: 3.63%; font-weight: bold">
                    <t t-if="type == 'account_type'">
                        <span>
                            <a t-att-data-t-att-domain="misc_domain" t-att-data-res-model="'account.move.line'" class="o_account_financial_reports_web_action_monetary_multi" style="color: black;">
                                <t t-raw="account_or_group_item_object['fin_bal']['bal_curr']" t-options="{'widget': 'monetary', 'display_currency': account['currency_id']}"/>
                            </a>
                        </span>
                    </t>
                    <t t-if="type == 'grouped_type'">
                        <span>
                            <a t-att-data-t-att-domain="misc_domain+misc_grouped_domain" t-att-data-res-model="'account.move.line'" class="o_account_financial_reports_web_action_monetary_multi" style="color: black;">
                                <t t-raw="account_or_group_item_object['fin_bal']['bal_curr']" t-options="{'widget': 'monetary', 'display_currency': account['currency_id']}"/>
                            </a>
                        </span>
                    </t>
                </div>
            </t>
            <t t-if="not account['currency_id']">
                <div class="act_as_cell amount" style="width: 3.63%; font-weight: bold"/>
                <div class="act_as_cell amount" style="width: 3.63%; font-weight: bold"/>
            </t>
        </t>

    </xpath>

</data>
```
Source: [snippets/account_financial_report.report_general_ledger_lines.initial_balance_and_cumulated.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.report_general_ledger_lines.initial_balance_and_cumulated.xml)

### Replace Header  
ID: `mint_system.account_financial_report.report_general_ledger_lines.replace_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.report_general_ledger_lines" priority="50">

    <xpath expr="//div[@class='act_as_row labels']" position="replace">

        <div class="act_as_row labels">

            <!--## col1 date-->
            <div class="act_as_cell first_column" style="width: 7.78%; text-align: left">
            Date
            </div>

            <!--## col2 move-->
            <div class="act_as_cell" style="width: 28%; text-align: left">Entry</div>

            <!--## col3 account code-->
            <div class="act_as_cell" style="width: 20%; text-align: left">
                <t>Account</t>
            </div>

            <!--## col4 debit-->
            <div class="act_as_cell amount" style="width: 8.89%;">Debit</div>

            <!--## col5 credit-->
            <div class="act_as_cell amount" style="width: 8.89%;">Credit</div>

            <!--## col6 balance cumulated-->
            <div class="act_as_cell amount" style="width: 8.89%;">
            Cumul. Bal.
            </div>

            <t t-if="foreign_currency">
                <!--## col7 amount_currency-->
                <div class="act_as_cell amount" style="width: 8.89%;">Amount cur.</div>
                <!--## col8 amount_currency cumulated-->
                <div class="act_as_cell amount" style="width: 8.89%;">Cumul cur.</div>
            </t>

        </div>

    </xpath>

</data>
```
Source: [snippets/account_financial_report.report_general_ledger_lines.replace_header.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.report_general_ledger_lines.replace_header.xml)

### Replace Lines  
ID: `mint_system.account_financial_report.report_general_ledger_lines.replace_lines`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_financial_report.report_general_ledger_lines" priority="50">

    <xpath expr="//t/div[@class='act_as_row lines']" position="replace">

        <div class="act_as_row lines">

            <!--## col1 -->
            <div class="act_as_cell left">
                <t t-if="line['id']">
                    <!--## We don't use t-field because it throws an error on click -->
                    <span t-att-res-id="line['id']" res-model="account.move.line" view-type="form">
                        <t t-esc="line['date']" t-options="{'widget': 'date'}"/>
                    </span>
                </t>
                <t t-else="">
                    <span>
                        <!--## We don't use t-field because it throws an error on click -->
                        <t t-esc="line['date']" t-options="{'widget': 'date'}"/>
                    </span>
                </t>
            </div>

            <!--## col2 -->
            <div class="act_as_cell left">
                <span>
                    <t>
                        <t t-if="line['entry_id']">
                            <span t-att-res-id="line['entry_id']" res-model="account.move" view-type="form">
                                <t t-esc="(line['entry'][:17] + '...') if len(line['entry']) &gt; 17 else line['entry']"/>
                            </span>
                        </t>
                    </t>

                    <t>
                        <t t-if="line['entry_id']">
                            <span t-att-res-id="line['entry_id']" res-model="account.move" view-type="form">
                                <t t-esc="(line['entry'][:17] + '...') if len(line['entry']) &gt; 17 else line['entry']"/>
                            </span>
                        </t>
                    </t>
                    

                    <span t-att-res-id="line['contra_accounts']" res-model="account.move.line" view-type="form">
                        <t t-raw="line['contra_accounts']"/>
                    </span>
                    <span t-att-res-id="line['partner_name']" res-model="account.move.line" view-type="form">
                        <t t-raw="line['partner_name']"/>
                    </span>

                    <br></br>
                </span>
            </div>

            <!--## col4 debit-->
            <div class="act_as_cell amount">
                <t t-if="line['id']">
                    <span t-att-res-id="line['id']" res-model="account.move.line" view-type="form">
                        <t t-raw="line['debit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
                <t t-else="">
                    <span>
                        <t t-raw="line['debit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
            </div>

            <!--## col5 credit-->
            <div class="act_as_cell amount">
                <t t-if="line['id']">
                    <span t-att-res-id="line['id']" res-model="account.move.line" view-type="form">
                        <t t-raw="line['credit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
                <t t-else="">
                    <span>
                        <t t-raw="line['credit']" t-options="{'widget': 'float', 'precision': 2}"/>
                    </span>
                </t>
            </div>

            <!--## col6 balance cumulated-->
            <div class="act_as_cell amount">
                <t t-if="line['id']">
                    <span t-att-res-id="line['id']" res-model="account.move.line" view-type="form">
                        <t t-raw="line['balance']" t-options="{'widget': 'monetary', 'display_currency': company_currency}"/>
                    </span>
                </t>
                <t t-else="">
                    <span>
                        <t t-raw="line['balance']" t-options="{'widget': 'monetary', 'display_currency': company_currency}"/>
                    </span>
                </t>
            </div>

            <t t-if="foreign_currency">
                <t t-if="line['currency_id']">
                    <t t-set="line_currency" t-value="currency_model.browse(line['currency_id'][0])"/>
                    <t t-set="total_bal_curr" t-value="total_bal_curr + line['bal_curr']" t-if="line_currency!=company_currency"/>
                    <!--## col7 amount_currency-->
                    <div class="act_as_cell amount" style="width: 3.63%;">
                        <span t-att-res-id="line['id']" res-model="account.move.line" view-type="form" t-raw="line['bal_curr']" t-options="{'widget': 'monetary', 'display_currency': line_currency}" t-if="line_currency!=company_currency"/>
                    </div>
                    <!--## col8 amount_currency cumulated-->
                    <div class="act_as_cell amount" style="width: 3.63%;">
                        <span t-att-res-id="line['id']" res-model="account.move.line" view-type="form" t-raw="total_bal_curr" t-options="{'widget': 'monetary', 'display_currency': line_currency}" t-if="line_currency!=company_currency"/>
                    </div>
                </t>
                <t t-if="not line['currency_id']">
                    <!--## col7 amount_currency-->
                    <div class="act_as_cell amount" style="width: 3.63%;"/>
                    <!--## col8 amount_currency cumulated-->
                    <div class="act_as_cell amount" style="width: 3.63%;"/>
                </t>
            </t>
        </div>

    </xpath>

</data>
```
Source: [snippets/account_financial_report.report_general_ledger_lines.replace_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/account_financial_report.report_general_ledger_lines.replace_lines.xml)

