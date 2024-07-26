import requests

# Function to get modules from a specific branch in a repository
def get_modules(repo, branch):
    url = f"https://api.github.com/repos/Mint-System/{repo}/contents?ref={branch}"
    response = requests.get(url)
    if response.status_code == 200:
        contents = response.json()
        modules = [item['name'] for item in contents if item['type'] == 'dir']
        return modules
    return []

# Define the repositories and branches to check
repositories = [
    "Odoo-Apps-Connector",
    "Odoo-Apps-Manufacture",
    "Odoo-Apps-Partner-Contact",
    "Odoo-Apps-Social",
    "Odoo-Apps-Account-Invoicing",
    "Odoo-Apps-Vertical-SaaS",
    "Odoo-Apps-Stock-Logistics-Workflow",
    "Odoo-Apps-Purchase-Workflow",
    "Odoo-Apps-Product-Attribute",
    "Odoo-Apps-HR",
    "Odoo-Apps-Sale-Workflow",
    "Odoo-Apps-Management",
    "Odoo-Apps-Server-Tools",
    "Odoo-Apps-Account-Financial-Reporting",
    "Odoo-Apps-Project",
    "Odoo-Apps-Website"
]
branches = ["14.0", "15.0", "16.0", "17.0"]

# Open the file to write the markdown tables
with open("modules.md", "w") as file:
    for repo_name in repositories:
        # Get the modules for each branch
        modules = {branch: get_modules(repo_name, branch) for branch in branches}

        # Prepare the table content in Markdown format
        table_header = f"### {repo_name}\n\n"
        table_header += "| Module Name | 14.0 Link | 15.0 Link | 16.0 Link | 17.0 Link | Comment |\n"
        table_header += "| --- | --- | --- | --- | --- | --- |\n"

        table_rows = []
        for module in modules["14.0"]:
            row = f"| {module} "
            for branch in branches:
                if module in modules[branch]:
                    link = f"https://github.com/Mint-System/{repo_name}/tree/{branch}/{module}"
                    row += f"| [GitHub Link]({link}) "
                else:
                    row += "| N/A "
            row += "| Mint System Module: Upgrade from Version 14.0 needed |"
            table_rows.append(row)

        markdown_table = table_header + "\n".join(table_rows) + "\n\n"

        # Write the markdown table to the file
        file.write(markdown_table)

print("Markdown tables written to modules.md")
