import flet as ft

class HomePage(ft.UserControl):
    def __init__(self):
        super().__init__()

    def build(self):
        return ft.Container(
            content=ft.Text("Bem-vindo à página inicial!", style="headlineMedium"),
            alignment=ft.alignment.center,
            expand=True,
        )

