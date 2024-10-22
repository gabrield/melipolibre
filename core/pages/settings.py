import flet as ft

class SettingsPage(ft.UserControl):
    def __init__(self):
        super().__init__()

    def build(self):
        return ft.Container(
            content=ft.Text("Configurações da aplicação", style="headlineMedium"),
            alignment=ft.alignment.center,
            expand=True,
        )

