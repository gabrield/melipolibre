import flet as ft
from core.pages.home import HomePage
from core.pages.settings import SettingsPage
from core.pages.profile import ProfilePage

# Função principal da aplicação
def main(page: ft.Page):
    page.title = "Melipolibre"
    page.window.width = 800
    page.window.height = 600

    # Configura o layout do menu lateral retrátil
    sidebar_expanded = True

    # Função para alternar a largura da sidebar
    def toggle_sidebar(e):
        nonlocal sidebar_expanded
        sidebar_expanded = not sidebar_expanded
        sidebar.width = 200 if sidebar_expanded else 0  # Defina a largura expandida e retraída
        for item in sidebar.controls:
            item.visible = sidebar_expanded  # Mostra/esconde os textos dos itens do menu
        menu_icon.icon = ft.icons.CHEVRON_LEFT if sidebar_expanded else ft.icons.CHEVRON_RIGHT
        page.update()

    # Função para trocar o conteúdo da view central
    def load_page(page_name):
        if page_name == "Home":
            content.content = HomePage()
        elif page_name == "Configurações":
            content.content = SettingsPage()
        elif page_name == "Perfil":
            content.content = ProfilePage()
        page.update()


    menu_icon = ft.IconButton(icon=ft.icons.MENU, on_click=toggle_sidebar)

    # Cabeçalho da aplicação
    header = ft.Row(
        controls=[
            menu_icon,
            ft.Text("Melipolibre", style="headlineSmall", expand=True),
            ft.IconButton(icon=ft.icons.SETTINGS, on_click=lambda _: load_page("Configurações")),
            ft.IconButton(icon=ft.icons.ACCOUNT_CIRCLE, on_click=lambda _: load_page("Perfil")),
            ft.IconButton(icon=ft.icons.LOGOUT),
        ],
        alignment=ft.MainAxisAlignment.SPACE_BETWEEN,
    )

    # Menu lateral retrátil
    sidebar = ft.Column(
        controls=[
            ft.ListTile(
                leading=ft.Icon(ft.icons.HOME),
                title=ft.Text("Home"),
                on_click=lambda _: load_page("Home"),
            ),
            ft.ListTile(
                leading=ft.Icon(ft.icons.SETTINGS),
                title=ft.Text("Configurações"),
                on_click=lambda _: load_page("Configurações"),
            ),
            ft.ListTile(
                leading=ft.Icon(ft.icons.PERSON),
                title=ft.Text("Perfil"),
                on_click=lambda _: load_page("Perfil"),
            ),
        ],
        animate_size=ft.Animation(250),  # Animação suave de 300ms
        width=200,
        visible=True
    )

    # Área principal onde o conteúdo das páginas será exibido
    content = ft.Container(expand=True)

    # Layout da página com menu lateral e conteúdo central
    page.add(
        ft.Row(
            controls=[
                sidebar,
                ft.VerticalDivider(width=1),
                ft.Column(controls=[header, content], expand=True),
            ],
            expand=True,
        )
    )

    # Carregar a página inicial
    load_page("Home")

# Inicializa a aplicação Flet
ft.app(target=main)

