Para correr a app:

1. Clonar o repositório 
2. Instalar postgres17, ruby 3.4.2 e ruby on rails
3. Instalar os packages com o comando “bundle install”
4. Iniciar a app no localhost com o comando “rails server”

Problemas encontrados:

(Revi o código pelo telefone então é possível que tenha coisas que eu não reparei)



1. Tamanho das views dos componente
-  Welcome index na versão mobile aparece com o tamanho errado o que faz quebrar os componentes de login/criar conta
 
Solução: mudar o tamanho original para ser especificamente compatível com a mobile view e garantir que esteja responsive 




2. Settings em falta 
- nas definições disponíveis para o user, só o botão de logout é que funciona, os outros componentes não foram criados ainda 

Solucão: criar os componentes em falta e garantir que a funcionalidade de abrir e fechar ou acessar as definições está a funcionar corretamente 




3. UI da app
- a user interface não está concluída, a aparência atual da aplicação não é a final e ainda faltam updates para aplicar um novo layout mais user friendly

Solução: só fazer update da UI quando tiver a certeza que todas as funcionalidades estejam a funcionar a 90% pelo menos 




4. Profile tabs
- no perfil do user onde tem a navigation tab onde aparece “feed, tagged, saved”, só o feed e o saved estão “funcionais”. A função de tag um user já está integrada, porém, ainda não mostra no perfil os posts em que o user foi tagged


Solução: testar a função de tag user fazendo um novo post e depois fazer com que esses posts onde o user foi tagged possam ser vistos no perfil do user 




5. Apagar/salvar posts
- na pagina home dá para apagar/criar/salvar e ver  posts mas de momento só nessa pagina é que essas 3 funcionalidades funcionam corretamente, tentar fazer uma dessas coisas em um outro componente vai produzir um erro ou fazer a app break. 

Solução: integrar essas funções para funcionarem no perfil do user tbm, por exemplo, apagar posts q estejam no seu perfil, remover identificação de posts onde foi tagged ou remover posts guardados 

Observação: tinha um bug q fazia com que os posts que o user guardou, se tornassem impossíveis se apagar sem antes remover dos saved posts, tem isso em mente, eu não consegui ter a certeza se nessa versão do codigo isso já está resolvido ou não 




6. Log in/criar conta
- As vezes ao criar uma conta ou fazer login, o user é redirecionado para a pagina de authentication ao inves da pagina home da app 

Solução: garantir que só as informações do user sejam verificadas durante o processo de auth e só depois de verificadas é que pode redirecionar-lo para a pagina Home

Observação: esse bug é muito mais complicado do que soa 




7. mapa para ver ginasios proximos 
- faltam ícones e informações sobre alguns ginasios e falta mostrar tbm a localização dos users que segues 

Solução: encontrar as informações em falta e adicionar um marker para mostrar a geo location de outros user (que segues) 



8. Monetizar 
- n tem nenhum tipo de monetização presente

Solução: integrar stripe 



9. Workout page (reel page) 
- tem o icone de um peso de ginasio e é onde aparecem os conteúdos de users “content creators”, a pagina ta set up pra mudar a aparência quando o user esta a usar o componente e falta só a função de adicionar videos e ativar os botões de like comment share

Solução: os videos reels só podem ser adicionados nesse componente, um video de um post normal n vai aparecer automaticamente nos reels, ao fazer upload de um reel garantir que o sistema faz check das regras de upload de reel, como as dimensões do video e duração

Observação: criar uma nova tabela pra registrar só posts que pas