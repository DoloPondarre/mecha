# README

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

# Mecha del Poncho - Documentación del Proyecto

# Catálogo Online

Esta aplicación es un catálogo online diseñado para manejar los productos de un negocio y permitir a los usuarios ver características y fotos de los productos cargados.

## Funcionalidades del Administrador

El Administrador puede iniciar sesión y administrar los productos disponibles en el sistema. Las funcionalidades específicas son:

- Ver la lista de productos disponibles.
- Agregar nuevos productos.
- Editar los detalles de los productos existentes.
- Marcar productos como disponibles o no disponibles.
- Marcar hasta 3 productos como "Feature" para que se muestren en el home.
- Eliminar productos.

## Funcionalidades del Visitante

Los visitantes de la página pueden realizar las siguientes acciones:

- Ver la lista de productos disponibles.
- Ver detalles de un producto específico.
- Buscar un producto por su nombre, descripción o color.

## Tecnologías Utilizadas

- **Ruby on Rails**: El framework utilizado para el desarrollo del backend.
- **HTML/CSS/JavaScript**: Las tecnologías básicas para el desarrollo del frontend.
- **Bootstrap**: Se utilizó para la maquetación y el diseño del sitio.
- **WhatsApp API**: Para enviar mensajes de WhatsApp con la confirmación del pedido.

## Instalación

Para instalar y ejecutar esta aplicación en tu máquina local, sigue estos pasos:

1. Clona este repositorio en tu máquina local.

    ```bash
    git clone <[URL_DEL_REPOSITORIO](https://github.com/DoloPondarre/mecha.git)>
    ```

2. Instala las dependencias de Ruby usando Bundler.

    ```bash
    bundle install
    ```

3. Configura la base de datos.

    ```bash
    rails db:create
    rails db:migrate
    ```

4. Inicia el servidor de Rails.

    ```bash
    rails server
    ```

5. Abre tu navegador web y visita `http://localhost:3000` para ver la aplicación en acción.
