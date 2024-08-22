import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Widget buildExpansionTile(
      {required BuildContext context,
      required String title,
      required String description,
      required String cases}) {
    return ExpansionTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ExpansionTile(
                title: Text(
                  "Casos",
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      cases,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Informações",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 28.8),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Polícia Civil",
                  description:
                      '''A Delegacia de Polícia Civil é o principal órgão de investigação criminal. Ela realiza a coleta de provas, investiga crimes, elabora boletins de ocorrência (BO) e conduz inquéritos policiais. Além disso, a delegacia também atua na prisão de suspeitos, cumprimento de mandados e outras atividades que garantem a aplicação da lei.''',
                  cases:
                      "Procure a Delegacia de Polícia Civil quando precisar registrar um BO por crimes como furtos, roubos, agressões físicas ou verbais, ameaças, desaparecimentos, entre outros. Também é o local para acompanhar investigações em andamento, prestar depoimentos ou obter informações sobre processos criminais."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia da Mulher",
                  description:
                      "A Delegacia da Mulher oferece um ambiente especializado e humanizado para o atendimento de mulheres vítimas de violência. Seu foco é combater crimes como violência doméstica, abusos sexuais, violência psicológica e patrimonial, entre outros. A delegacia conta com profissionais capacitados para fornecer suporte emocional, orientação jurídica e proteção às vítimas, além de realizar investigações e encaminhamentos necessários.",
                  cases:
                      "Procure a Delegacia da Mulher em casos de violência de gênero, seja física, sexual, psicológica ou econômica. Se você ou alguém próximo estiver em situação de risco ou sofrendo abuso, este é o local adequado para buscar proteção, registrar denúncias e obter apoio especializado."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia do Idoso",
                  description:
                      "A Delegacia do Idoso é dedicada à proteção e defesa dos direitos das pessoas idosas. Ela investiga e combate crimes como maus-tratos, negligência, abuso financeiro, abandono e violência física ou psicológica contra os idosos. Além disso, a delegacia oferece orientações e encaminhamentos para assegurar o bem-estar e a segurança da população idosa.",
                  cases:
                      "Quando um idoso está sendo maltratado, negligenciado ou explorado financeiramente, a Delegacia do Idoso deve ser procurada para registrar a ocorrência, iniciar uma investigação e tomar medidas legais para proteger a vítima."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Crimes Cibernéticos",
                  description:
                  "Especializada em crimes cometidos através da internet, a Delegacia de Crimes Cibernéticos investiga fraudes eletrônicas, roubo de dados, invasões de sistemas, disseminação de conteúdo ilegal e outros delitos virtuais. A delegacia também atua na prevenção e conscientização sobre os riscos e as medidas de segurança no ambiente digital.",
                  cases:
                  "Se você foi vítima de golpes online, teve suas informações pessoais ou financeiras comprometidas, sofreu ataques virtuais como phishing ou ransomware, ou se deparou com conteúdos ilegais na internet, esta delegacia é a responsável por investigar e combater esses crimes."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Homicídios",
                  description:
                  "A Delegacia de Homicídios é responsável pela investigação de crimes de homicídio e tentativa de homicídio. A equipe especializada realiza a coleta de provas, perícias, identificação de suspeitos e outras atividades para solucionar esses crimes e levar os responsáveis à justiça. Além disso, a delegacia oferece suporte às famílias das vítimas durante o processo investigativo.",
                  cases:
                  "Em casos de homicídio ou tentativa de homicídio, é essencial acionar a Delegacia de Homicídios para que uma investigação detalhada seja conduzida. A delegacia também deve ser procurada para denúncias e informações que possam auxiliar na resolução de casos relacionados."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Narcóticos",
                  description:
                  "Focada no combate ao tráfico de drogas, a Delegacia de Narcóticos investiga e reprime a produção, distribuição e venda de substâncias ilícitas. A delegacia realiza operações de apreensão de drogas, prisão de traficantes e investigações para desmantelar redes de tráfico. Além disso, atua na conscientização sobre os perigos do uso de drogas.",
                  cases:
                  "Se você tiver informações sobre pontos de venda de drogas, presenciar atividades suspeitas relacionadas ao tráfico ou for vítima de crimes envolvendo substâncias ilícitas, procure a Delegacia de Narcóticos para denunciar e auxiliar nas investigações."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Atendimento ao Turista (Deat)",
                  description:
                  "A Delegacia de Atendimento ao Turista é especializada em oferecer suporte a visitantes que enfrentam problemas durante sua estadia. Ela registra boletins de ocorrência para casos como furtos, roubos, perda de documentos, entre outros, e oferece assistência em várias línguas para garantir que o turista compreenda e resolva sua situação. A delegacia também atua na orientação sobre os procedimentos legais no país.",
                  cases:
                  "Turistas que foram vítimas de crimes, perderam documentos ou precisam de orientação sobre questões legais durante sua viagem devem procurar a Delegacia de Atendimento ao Turista para receber apoio adequado, registrar ocorrências e obter informações sobre seus direitos e deveres."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Crimes Contra o Meio Ambiente",
                  description:
                  "A Delegacia de Crimes Contra o Meio Ambiente é encarregada de investigar e reprimir ações que causem danos ao meio ambiente. Isso inclui crimes como desmatamento ilegal, poluição de rios e solos, caça e tráfico de animais silvestres, e outras atividades que prejudicam a natureza. A delegacia atua na preservação dos recursos naturais e na aplicação das leis ambientais.",
                  cases:
                  "Em casos de desmatamento ilegal, poluição, maus-tratos a animais silvestres ou outras agressões ao meio ambiente, procure esta delegacia para registrar denúncias, solicitar investigações e promover a proteção ambiental."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Proteção à Criança e ao Adolescente",
                  description:
                  "Focada na proteção dos direitos de crianças e adolescentes, esta delegacia investiga e combate crimes como violência, abuso sexual, exploração e negligência contra menores. A delegacia oferece suporte psicológico, social e jurídico às vítimas e suas famílias, além de atuar na prevenção e educação sobre os direitos infantojuvenis.",
                  cases:
                  "Se você souber de casos de abuso, violência, exploração ou negligência envolvendo crianças ou adolescentes, procure esta delegacia para registrar a denúncia, garantir a proteção da vítima e iniciar as devidas investigações."),
              const SizedBox(height: 12),
              buildExpansionTile(
                  context: context,
                  title: "Delegacia de Trânsito",
                  description:
                  "A Delegacia de Trânsito lida com ocorrências relacionadas ao trânsito, como acidentes, infrações graves, direção perigosa e embriaguez ao volante. Ela investiga as circunstâncias dos acidentes, elabora boletins de ocorrência e aplica as sanções cabíveis conforme a legislação de trânsito.",
                  cases:
                  "Procure a Delegacia de Trânsito se você se envolveu em um acidente de trânsito, testemunhou uma infração grave, ou precisa registrar uma ocorrência relacionada a questões viárias, como direção sob influência de álcool ou fuga do local do acidente."),
            ],
          ),
        ),
      ),
    );
  }
}
