# registro-docker

Registro de Docker privado con UI.

## Prerrequisitos

1. Instalar [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. En Windows, [instalar el comando `make`](https://github.com/ijaureguialzo/make-scoop-windows/blob/master/README.md).

## Puesta en marcha

1. Añadir las entradas necesarias al fichero _hosts_ del sistema:

   En macOS y Linux:

   ```shell
   sudo bash -c '{
   echo "127.0.0.1    registro-docker.test"
   } >> /etc/hosts'
   ```

   En Windows (desde un símbolo del sistema con privilegios de administrador):

   ```powershell
   (
   echo 127.0.0.1    registro-docker.test
   ) >> %SystemRoot%\System32\drivers\etc\hosts
   ```

2. Copiar el fichero `env-example` a `.env`:

   En macOS y Linux:

   ```shell
   cp env-example .env
   ```

   En Windows:

   ```shell
   copy env-example .env
   ```

3. Crear un usuario y contraseña de acceso al registro:

    ```shell
    make password
    ```

4. Arrancar el contenedor:

    ```shell
    make start
    ```

5. Acceder al [interfaz web del registro](https://registro-docker.test).

## Referencias

- [Docker Registry User Interface](https://joxit.dev/docker-registry-ui/)
- [Alpine release branches](https://alpinelinux.org/releases/)
- [Docker Registry Static as standalone example](https://github.com/Joxit/docker-registry-ui/tree/main/examples/ui-as-standalone)
- [A Guide to Docker Private Registry](https://www.baeldung.com/ops/docker-private-registry)
- [Pushing a Docker Image to a Self-Hosted Registry](https://www.baeldung.com/ops/docker-push-image-self-hosted-registry)
