import flet as ft

class ProfilePage(ft.UserControl):
    def __init__(self):
        super().__init__()

    def build(self):
        return ft.Container(
            content=ft.Text("Página de Perfil do Usuário", style="headlineMedium"),
            alignment=ft.alignment.center,
            expand=True,
        )

