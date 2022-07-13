from datetime import date
from robot.libraries.BuiltIn import BuiltIn

class ExampleLibrary:
    def get_current_date(self):
        BuiltIn().log_to_console("Keyword from ExampleLibrary")
        return date.today()