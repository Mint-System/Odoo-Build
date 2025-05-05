# Survey
## Layout  
### Remove Brand Promotion Message  
ID: `mint_system.survey.layout.remove_brand_promotion_message`  
```xml
<data inherit_id="survey.layout" priority="50">
    <div t-call="web.brand_promotion_message" position="replace"/>
</data>

```
Source: [snippets/survey.layout.remove_brand_promotion_message.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/survey.layout.remove_brand_promotion_message.xml)

### Set Head Title  
ID: `mint_system.survey.layout.set_head_title`  
```xml
<data inherit_id="survey.layout" priority="50">
    <xpath expr="//head" position="before">
        <t t-if="survey">
            <t t-set="title" t-value="('Sozialinfo - ' + survey.title) if survey else 'Odoo'"/>
            <t t-set="x_icon" t-value="'/web/image?model=res.company&amp;id=1&amp;field=favicon'"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/survey.layout.set_head_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/survey.layout.set_head_title.xml)

## Survey Question Form  
### Add Button Start Survey  
ID: `mint_system.survey.survey_question_form.add_button_start_survey`  
```xml
<data inherit_id="survey.survey_question_form" priority="50">
    <button name="action_start_session" position="after">
        <button name="action_start_survey" string="Start Survey" type="object" attrs="{'invisible': [('state', '=', 'draft')]}"/>
    </button>
</data>

```
Source: [snippets/survey.survey_question_form.add_button_start_survey.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/survey.survey_question_form.add_button_start_survey.xml)

### Enable Create  
ID: `mint_system.survey.survey_question_form.enable_create`  
```xml
<data inherit_id="survey.survey_question_form" priority="50">
    <form position="attributes">
        <attribute name="create">1</attribute>
    </form>
</data>

```
Source: [snippets/survey.survey_question_form.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/survey.survey_question_form.enable_create.xml)

## Survey Question Tree  
### Enable Create  
ID: `mint_system.survey.survey_question_tree.enable_create`  
```xml
<data inherit_id="survey.survey_question_tree" priority="50">
    <tree position="attributes">
        <attribute name="create">1</attribute>
    </tree>
</data>

```
Source: [snippets/survey.survey_question_tree.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/survey.survey_question_tree.enable_create.xml)

## Survey User Input View Tree  
### X Department Id  
ID: `mint_system.survey.survey_user_input_view_tree.x_department_id`  
```xml
<data inherit_id="survey.survey_user_input_view_tree" priority="50">
    <xpath expr="//field[@name='partner_id']" position="after">
        <field name="x_department_id" optional="show"/>
    </xpath>
</data>

```
Source: [snippets/survey.survey_user_input_view_tree.x_department_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/survey.survey_user_input_view_tree.x_department_id.xml)

### X Manager Id  
ID: `mint_system.survey.survey_user_input_view_tree.x_manager_id`  
```xml
<data inherit_id="survey.survey_user_input_view_tree" priority="50">
    <xpath expr="//field[@name='partner_id']" position="after">
        <field name="x_manager_id" optional="show"/>
    </xpath>
</data>

```
Source: [snippets/survey.survey_user_input_view_tree.x_manager_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/survey.survey_user_input_view_tree.x_manager_id.xml)

