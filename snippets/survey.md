# Survey
## Survey Question Form  
### Add Button Start Survey  
ID: `mint_system.survey.survey_question_form.add_button_start_survey`  
```xml
<?xml version="1.0"?>
<data inherit_id="survey.survey_question_form" priority="50">

  <button name="action_start_session" position="after">
    <button name="action_start_survey" string="Start Survey" type="object" attrs="{'invisible': [('state', '=', 'draft')]}" />
  </button>

</data>

```
Source: [snippets/survey.survey_question_form.add_button_start_survey.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/survey.survey_question_form.add_button_start_survey.xml)

### Enable Create  
ID: `mint_system.survey.survey_question_form.enable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="survey.survey_question_form" priority="50">

  <form position="attributes">
    <attribute name="create">1</attribute>
  </form>

</data>

```
Source: [snippets/survey.survey_question_form.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/survey.survey_question_form.enable_create.xml)

## Survey Question Tree  
### Enable Create  
ID: `mint_system.survey.survey_question_tree.enable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="survey.survey_question_tree" priority="50">

  <tree position="attributes">
    <attribute name="create">1</attribute>
  </tree>

</data>

```
Source: [snippets/survey.survey_question_tree.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/survey.survey_question_tree.enable_create.xml)

