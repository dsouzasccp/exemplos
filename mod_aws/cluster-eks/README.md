# Cluster EKS

Módulo criado para ser entregue tanto nas contas antigas (negociosdev) como na conta nova no modelo LandingZone (gglobo-adtech-dev).


## Exemplo de uso

Na raíz do projeto há uma pasta chamada "exemplo", onde contém os arquivos necessários para o deploy.

No arquivo variables.tf deve ser setados os valores que serão usados para deploy do seu cluster de EKS.

```terraform
variable "account_adtech" {
    type    = bool
    description = "Variável para ser deployado na conta LandingZone ou não."
    default = false
}
```

Caso a  variável `account_adtech` seja `true`, no arquivo ```main.tf``` deverão ser comentadas as linhas 2 à 15 e descomentadas as linhas 18 à 31. E os parâmetros `key`e `profile`deverão ser alterados com a informação do nome do cluster e sua credencial de acesso a AWS.

Para deploy acesse a pasta exemplo e rode os seguintes comandos:

```terraform
terraform init

terraform plan -out "plan"

terraform apply "plan"
}
```

## Melhorias
- Inclusão de instâncias spot para os worker nodes.
- Inclusão de tags adicionais no ASG.

## Contribuição
Esse repositório aceita contribuição via merge request.

## License
[MIT](https://choosealicense.com/licenses/mit/)

