import '/backend/schema/structs/index.dart';
import '/dashboard/dashboard/dashboard_widget.dart';
import '/dashboard/final_pitch/final_pitch_widget.dart';
import '/dashboard/skip_dialog/skip_dialog_widget.dart';
import '/email_template/login_component/login_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/footer/footer_button/footer_button_widget.dart';
import '/header/header_with_progress_bar/header_with_progress_bar_widget.dart';
import '/loading_template/loading_screen_before_result/loading_screen_before_result_widget.dart';
import '/loading_template/start_loading_component/start_loading_component_widget.dart';
import '/pitch_body_templates/pitch_body_detailed_text_images/pitch_body_detailed_text_images_widget.dart';
import '/pitch_body_templates/pitch_body_result_label_pitch/pitch_body_result_label_pitch_widget.dart';
import '/pitch_body_templates/pitch_body_simple_text_images_body/pitch_body_simple_text_images_body_widget.dart';
import '/templates/image_background_ques_body/image_background_ques_body_widget.dart';
import '/templates/image_background_ques_body_v3/image_background_ques_body_v3_widget.dart';
import '/templates/multi_choice_with_image_question_check_box/multi_choice_with_image_question_check_box_widget.dart';
import '/templates/question_answer/question_answer_widget.dart';
import '/templates/question_answer_additionl_info/question_answer_additionl_info_widget.dart';
import '/templates/rating_question_options/rating_question_options_widget.dart';
import '/templates/single_choice_question_large_image/single_choice_question_large_image_widget.dart';
import '/templates/single_choice_question_smalllmage/single_choice_question_smalllmage_widget.dart';
import '/templates/titles_and_description_ans_body/titles_and_description_ans_body_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isWebview = await actions.isFacebookWebView();
      FFAppState().isWebview = _model.isWebview!;
      safeSetState(() {});
      setAppLanguage(context, 'es');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (valueOrDefault<bool>(
                      FFAppState().quizIndex != 0,
                      true,
                    ) &&
                    (FFAppState().quizIndex != 19) &&
                    (FFAppState().quizIndex != 14) &&
                    (FFAppState().quizIndex != 21))
                  wrapWithModel(
                    model: _model.headerWithProgressBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HeaderWithProgressBarWidget(
                      isProgress: (FFAppState().quizIndex != 0) &&
                          (FFAppState().quizIndex != 19),
                      isBack: (FFAppState().quizIndex != 0) &&
                          (FFAppState().quizIndex != 6) &&
                          ((FFAppState().quizIndex != 0) &&
                              (FFAppState().quizIndex != 19) &&
                              (FFAppState().quizIndex != 20)) &&
                          (FFAppState().quizIndex != 7) &&
                          (FFAppState().quizIndex != 9) &&
                          (FFAppState().quizIndex != 14) &&
                          (FFAppState().quizIndex != 15) &&
                          (FFAppState().quizIndex != 20) &&
                          (FFAppState().quizIndex != 21),
                      fillColor: FlutterFlowTheme.of(context).info,
                      totalQuestion: 19,
                      currentQuestion: FFAppState().quizIndex,
                      totalSegments: 5,
                      backAction: () async {
                        await _model.pageViewController?.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      onPageChanged: (_) async {
                        FFAppState().quizIndex = _model.pageViewCurrentIndex;
                        FFAppState().update(() {});
                      },
                      scrollDirection: Axis.horizontal,
                      children: [
                        Builder(
                          builder: (context) => wrapWithModel(
                            model: _model.startGoalImageBackgroundQuesBodyModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageBackgroundQuesBodyWidget(
                              question:
                                  'Descubre si el Reto es para ti y tu tipo de cabello ',
                              answer1: '',
                              answer2: FFLocalizations.of(context).getText(
                                'hjp0vvi2' /*  */,
                              ),
                              logoShow: true,
                              image:
                                  'https://assets.hairqare.co/sarah-quiz-start-cover.webp',
                              answer3: FFLocalizations.of(context).getText(
                                'd4329zzl' /*  */,
                              ),
                              questionId: 'diagnosisFD',
                              skipAction: () async {
                                await actions.trackGAEvent(
                                  'Opened Skip Dialog',
                                  '',
                                  '',
                                  FFAppConstants.nonQuestionAnswerItem.toList(),
                                  '',
                                  '',
                                );
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: SkipDialogWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              checkBoxToggleOn: () async {},
                              checkBoxToggleOff: () async {},
                              answerAction1: () async {
                                FFAppState().updateQuizProfileStruct(
                                  (e) => e
                                    ..updateQaPairs(
                                      (e) => e.add(QuestionAnswerPairStruct(
                                        questionId: _model
                                            .startGoalImageBackgroundQuesBodyModel
                                            .questionId,
                                        answerIds: _model
                                            .startGoalImageBackgroundQuesBodyModel
                                            .selectedAnswerId,
                                      )),
                                    ),
                                );
                                safeSetState(() {});
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              answerAction2: () async {
                                FFAppState().updateQuizProfileStruct(
                                  (e) => e
                                    ..updateQaPairs(
                                      (e) => e.add(QuestionAnswerPairStruct(
                                        questionId: _model
                                            .startGoalImageBackgroundQuesBodyModel
                                            .questionId,
                                        answerIds: _model
                                            .startGoalImageBackgroundQuesBodyModel
                                            .selectedAnswerId,
                                      )),
                                    ),
                                );
                                safeSetState(() {});
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              answerAction3: () async {
                                FFAppState().updateQuizProfileStruct(
                                  (e) => e
                                    ..updateQaPairs(
                                      (e) => e.add(QuestionAnswerPairStruct(
                                        questionId: _model
                                            .startGoalImageBackgroundQuesBodyModel
                                            .questionId,
                                        answerIds: _model
                                            .startGoalImageBackgroundQuesBodyModel
                                            .selectedAnswerId,
                                      )),
                                    ),
                                );
                                safeSetState(() {});
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.typeSingleChoiceQuestionLargeImageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SingleChoiceQuestionLargeImageWidget(
                            question: '¿Qué tipo de cabello tienes?',
                            subQuestion: FFLocalizations.of(context).getText(
                              'bdqv46ra' /*  */,
                            ),
                            answerData: FFAppState().hairType,
                            questionId: '',
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: valueOrDefault<String>(
                                        _model
                                            .typeSingleChoiceQuestionLargeImageModel
                                            .questionId,
                                        'test',
                                      ),
                                      answerIds: _model
                                          .typeSingleChoiceQuestionLargeImageModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.ageSingleChoiceQuestionSmalllmageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SingleChoiceQuestionSmalllmageWidget(
                            question: '¿Cuántos años tienes?',
                            subQuestion: FFLocalizations.of(context).getText(
                              'zf9jz0od' /*  */,
                            ),
                            answerList: FFAppState().age,
                            showBeforeQuestionTitle: false,
                            beforeQuestionTitle:
                                FFLocalizations.of(context).getText(
                              'i2ojmi0m' /*  */,
                            ),
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .ageSingleChoiceQuestionSmalllmageModel
                                          .questionId,
                                      answerIds: _model
                                          .ageSingleChoiceQuestionSmalllmageModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model:
                              _model.concernSingleChoiceQuestionSmalllmageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SingleChoiceQuestionSmalllmageWidget(
                            question:
                                '¿Qué es lo que más te preocupa de tu cabello en este momento?',
                            subQuestion: FFLocalizations.of(context).getText(
                              'onimc71u' /* Elige una */,
                            ),
                            answerList: FFAppState().hairConcern,
                            questionId: '',
                            showBeforeQuestionTitle: false,
                            beforeQuestionTitle:
                                FFLocalizations.of(context).getText(
                              '3qsxpsqp' /*  */,
                            ),
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .concernSingleChoiceQuestionSmalllmageModel
                                          .questionId,
                                      answerIds: _model
                                          .concernSingleChoiceQuestionSmalllmageModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.durationQuestionAnswerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: QuestionAnswerWidget(
                            question:
                                '¿Cuánto tiempo llevas con${valueOrDefault<String>(
                              () {
                                if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_hairloss'],
                                    ))) {
                                  return 'caída del cabello o adelgazamiento?';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_splitends'],
                                    ))) {
                                  return 'frizz y sequedad?';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_scalp'],
                                    ))) {
                                  return 'problemas en el cuero cabelludo?';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_damage'],
                                    ))) {
                                  return 'cabello dañado?';
                                } else {
                                  return 'estos problemas con tu cabello?';
                                }
                              }(),
                              'For how long have you been experiencing your hair issues?',
                            )}',
                            answerList: FFAppState().concernDuration,
                            questionId: '',
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .durationQuestionAnswerModel
                                          .questionId,
                                      answerIds: _model
                                          .durationQuestionAnswerModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.routineTitlesAndDescriptionAnsBodyModel,
                          updateCallback: () => safeSetState(() {}),
                          child: TitlesAndDescriptionAnsBodyWidget(
                            question:
                                '¿Cómo describirías mejor tu rutina actual de cuidado del cabello?',
                            description: FFLocalizations.of(context).getText(
                              'dp0mkedt' /*  */,
                            ),
                            answerList: FFAppState().currentRoutine,
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .routineTitlesAndDescriptionAnsBodyModel
                                          .questionId,
                                      answerIds: _model
                                          .routineTitlesAndDescriptionAnsBodyModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model:
                              _model.pitchHFD1PitchBodyTextImagesBodyCopyModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PitchBodySimpleTextImagesBodyWidget(
                            description: FFLocalizations.of(context).getText(
                              'blcnnajw' /*  */,
                            ),
                            navigationTap: () async {
                              await actions.trackGAEvent(
                                'Continued From Pitch',
                                '',
                                'Damage Pitch',
                                FFAppConstants.nonQuestionAnswerItem.toList(),
                                '',
                                '',
                              );
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model
                              .hairqareMethodSingleChoiceQuestionSmalllmageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SingleChoiceQuestionSmalllmageWidget(
                            question:
                                '¿Qué tan familiarizado estás con HairQare y con nuestro enfoque de cuidado holístico del cabello?',
                            subQuestion: '',
                            questionId: 'hairqare',
                            showBeforeQuestionTitle: false,
                            beforeQuestionTitle: '',
                            answerList: FFAppState().hairqareKnowledge,
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .hairqareMethodSingleChoiceQuestionSmalllmageModel
                                          .questionId,
                                      answerIds: _model
                                          .hairqareMethodSingleChoiceQuestionSmalllmageModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.pitchBodyTextImagesHolisticModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PitchBodyDetailedTextImagesWidget(
                            title:
                                'Un cabello hermoso necesita algo más que solo productos.',
                            description:
                                'Nuestros programas basados en evidencia son desarrollados por Sarah Tran, una especialista certificada en caída del cabello, junto con un equipo de investigadores, científicos de formulación y profesionales médicos.',
                            claim:
                                'Demostrado clínicamente para restablecer el equilibrio de los folículos capilares de forma rápida y permanente.',
                            valueProp: 'Resultados comprobados para cualquier:',
                            value1: 'Edad',
                            value2: 'Problema de cabello',
                            value3: 'Tipo de cabello',
                            value4: 'Objetivo de cabello',
                            navigationTap: () async {
                              await actions.trackGAEvent(
                                'Continued From Pitch',
                                '',
                                'Holistic Pitch',
                                FFAppConstants.nonQuestionAnswerItem.toList(),
                                '',
                                '',
                              );
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dietSingleChoiceQuestionSmalllmageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SingleChoiceQuestionSmalllmageWidget(
                            question: '¿Cuál describe mejor tu dieta?',
                            subQuestion: '',
                            answerList: FFAppState().diet,
                            questionId: '',
                            showBeforeQuestionTitle: true,
                            beforeQuestionTitle:
                                'Lo que comemos afecta el crecimiento y la salud de nuestro cabello.',
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .dietSingleChoiceQuestionSmalllmageModel
                                          .questionId,
                                      answerIds: _model
                                          .dietSingleChoiceQuestionSmalllmageModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.spendQuestionAnswerAdditionlInfoModel,
                          updateCallback: () => safeSetState(() {}),
                          child: QuestionAnswerAdditionlInfoWidget(
                            question:
                                '¿Cuánto gastas en una botella de champú?',
                            answerList: FFAppState().shampooSpending,
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .spendQuestionAnswerAdditionlInfoModel
                                          .questionId,
                                      answerIds: _model
                                          .spendQuestionAnswerAdditionlInfoModel
                                          .answerId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await actions.trackGAEvent(
                                'Question Answered',
                                _model.spendQuestionAnswerAdditionlInfoModel
                                    .questionId,
                                _model.spendQuestionAnswerAdditionlInfoModel
                                    .question,
                                _model.spendQuestionAnswerAdditionlInfoModel
                                    .answerId
                                    .toList(),
                                '',
                                '',
                              );
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model
                              .mythsMultiChoiceWithImageQuestionCheckBoxModel,
                          updateCallback: () => safeSetState(() {}),
                          child: MultiChoiceWithImageQuestionCheckBoxWidget(
                            question:
                                '¿En cuál de estos mitos sobre el cuidado del cabello crees?',
                            answerList: FFAppState().hairMyth,
                            questionId: 'hairMyth',
                            navigationTap: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      answerIds: _model
                                          .mythsMultiChoiceWithImageQuestionCheckBoxModel
                                          .selectedAnswer,
                                      questionId: _model
                                          .mythsMultiChoiceWithImageQuestionCheckBoxModel
                                          .questionId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model
                              .damagePracticeMultiChoiceWithImageQuestionCheckBoxModel,
                          updateCallback: () => safeSetState(() {}),
                          child: MultiChoiceWithImageQuestionCheckBoxWidget(
                            question: FFLocalizations.of(context).getText(
                              'ugf9xggr' /* Selecciona las prácticas dañin... */,
                            ),
                            answerList: FFAppState().hairDamageActivity,
                            questionId: 'hairDamageActivity',
                            navigationTap: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      answerIds: _model
                                          .damagePracticeMultiChoiceWithImageQuestionCheckBoxModel
                                          .selectedAnswer,
                                      questionId: _model
                                          .damagePracticeMultiChoiceWithImageQuestionCheckBoxModel
                                          .questionId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model:
                              _model.problemDescriptionQuestionSmalllmageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SingleChoiceQuestionSmalllmageWidget(
                            question:
                                '¿Cómo describirías tus problemas de cabello?',
                            subQuestion: '',
                            questionId: 'problemDescription',
                            showBeforeQuestionTitle: false,
                            beforeQuestionTitle:
                                'Comprender tu tipo cabello es la clave.',
                            answerList: FFAppState().problemDescription,
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .problemDescriptionQuestionSmalllmageModel
                                          .questionId,
                                      answerIds: _model
                                          .problemDescriptionQuestionSmalllmageModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.hFDtypePitchBodyResultLabelPitchModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PitchBodyResultLabelPitchWidget(
                            title: FFLocalizations.of(context).getText(
                              'o7lj8r75' /*  */,
                            ),
                            description: valueOrDefault<String>(
                              () {
                                if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Esta caída de cabello persistente demuestra que tus folículos capilares están atrapados en un síndrome de apagado.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'Esta caída de cabello cada vez mayor indica un síndrome de cierre, que se está extendiendo por todos tus folículos capilares.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Esta caída de cabello impredecible demuestra que tus folículos capilares están atrapados en un síndrome de apagado.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Cada nuevo problema capilar es señal de un síndrome de apagado que se está propagando por todos tus folículos capilares.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Este daño capilar persistente muestra que tus folículos capilares siguen produciendo cabello débil.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'El daño capilar que va en aumento significa que tus folículos están produciendo un cabello cada vez más débil.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Este patrón de daño impredecible muestra que tus folículos están funcionando de forma irregular.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Cada nuevo problema de textura demuestra que el sistema de producción de tus folículos capilares se está descomponiendo aún más.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Este problema persistente del cuero cabelludo demuestra que tus folículos capilares están atrapados en una inflamación crónica.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'Los problemas en el cuero cabelludo que van en aumento muestran que la inflamación se está propagando.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Este patrón impredecible del cuero cabelludo demuestra que tus folículos capilares están en un estado inestable y reactivo.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Cada nuevo problema en el cuero cabelludo demuestra que la inflamación se está extendiendo y está afectando más funciones de los folículos capilares.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Esta persistente mezcla de problemas revela que tus folículos capilares están crónicamente sobrecargados.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'Estos problemas capilares mixtos que van en aumento demuestran que tus folículos capilares se están sobrecargando con el tiempo.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Esta combinación de problemas muestra que tus folículos capilares están crónicamente sobrecargados.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Cada nuevo problema capilar demuestra que tus folículos se están sobrecargando y perdiendo el control.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Este daño capilar persistente demuestra que tus folículos están atrapados produciendo cabello débil.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'El daño capilar que va en aumento hace que tus folículos produzcan cabello más débil con el tiempo.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Este patrón de daño impredecible muestra que tus folículos capilares están funcionando de manera irregular.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Cada nuevo problema de textura demuestra que el sistema de producción de tus folículos capilares se está deteriorando aún más.';
                                } else {
                                  return 'Esta mezcla de problemas muestra que tus folículos capilares están crónicamente sobrecargados.';
                                }
                              }(),
                              'This persistent mix of problems shows your  hair follicles are chronically overwhelmed.',
                            ),
                            claim: '',
                            valueProp: FFLocalizations.of(context).getText(
                              'xgrtm968' /* Esto es lo que puedes lograr e... */,
                            ),
                            value1: FFLocalizations.of(context).getText(
                              'runyv089' /*  */,
                            ),
                            value2: FFLocalizations.of(context).getText(
                              '67s8av9p' /*  */,
                            ),
                            value3: FFLocalizations.of(context).getText(
                              'wrw01rih' /*  */,
                            ),
                            value4: FFLocalizations.of(context).getText(
                              '6atwdsko' /*  */,
                            ),
                            conclusion: '',
                            typeLabel: () {
                              if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_hairloss'],
                                  ))) {
                                return 'FOLÍCULOS CAPILARES SECUESTRADOS';
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_damage'],
                                  ))) {
                                return 'FOLICULOS CAPILARES DEFECTUOSOS';
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_scalp'],
                                  ))) {
                                return 'FOLICULOS CAPILARES INFLAMADOS';
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_splitends'],
                                  ))) {
                                return 'FOLICULOS CAPILARES DEFECTUOSOS';
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_mixed'],
                                  ))) {
                                return 'FOLÍCULOS CAPILARES SOBRECARGADOS';
                              } else {
                                return 'FOLÍCULOS CAPILARES SOBRECARGADOS';
                              }
                            }(),
                            titleLabel: FFLocalizations.of(context).getText(
                              'miv9wl0i' /* Según tus respuestas, tu tipo ... */,
                            ),
                            explanationDetail: valueOrDefault<String>(
                              () {
                                if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Aunque tal vez no lo sientas, el ambiente de tu cuero cabelludo es demasiado hostil para el funcionamiento saludable de los folículos capilares. Tanto es así que tus folículos tienen que apagarse y soltar cabello como autoprotección. Todo ese cuidado extra se desperdicia, porque estás nutriendo folículos que ya decidieron dejar de crecer.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'Aunque no lo sientas, el ambiente de tu cuero cabelludo se está volviendo tan hostil para el funcionamiento de tus folículos capilares, que estos tienen que dejar de trabajar y el cabello se cae como autoprotección. Todo ese cuidado extra termina en vano, alimentando folículos que ya decidieron dejar de crecer.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Puede que no lo sientas, pero el ambiente de tu cuero cabelludo es tan hostil para que tus folículos funcionen de forma saludable que se quedan inactivos y el cabello se cae como autoprotección. Todo ese cuidado extra se desperdicia, alimentando folículos que quieren crecer con desesperación, pero no logran volver a empezar.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Aunque no lo sientas, el ambiente de tu cuero cabelludo es demasiado hostil para tus folículos capilares. Tanto que muchos folículos tienen que dejar de funcionar, uno por uno, como autoprotección. Todo ese cuidado extra ya no sirve de nada; está nutriendo folículos que ya han decidido dejar de crecer.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares son como una fábrica con maquinaria rota: todavía producen cabello, pero sale frágil y defectuoso. Esto te obliga a esforzarte aún más, pero obtienes menos resultados.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'Tus folículos son como una fábrica con maquinaria rota: todavía están produciendo cabello, pero sale frágil y defectuoso. Cada mechón nuevo es más débil que el anterior, porque el folículo ya no puede construir una estructura capilar adecuada.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares son como una fábrica con maquinaria rota: aún producen cabello, pero sale frágil y con defectos. A veces la maquinaria funciona mejor que otras, y tienes días de pelo bueno mezclados con días malos.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Tus folículos son como una fábrica con maquinaria rota: siguen produciendo cabello, pero sale frágil y defectuoso. A medida que fallan más partes del proceso de producción, se acumulan más tipos de cabello dañado.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'El ambiente de tu cuero cabelludo es hostil para el crecimiento capilar saludable. Toda la energía de tus folículos capilares se concentra en controlar la inflamación (comezón) y en la sobreproducción de grasa y de piel muerta (caspa), lo que dificulta el crecimiento capilar saludable.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'El ambiente de tu cuero cabelludo es hostil para el correcto funcionamiento de los folículos. La inflamación descontrolada hace que tus folículos produzcan un exceso de grasa y caspa, mientras crea un ambiente cada vez más tóxico que impide que funcionen.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'El ambiente de tu cuero cabelludo es hostil para el funcionamiento saludable de los folículos capilares. La inflamación constante hace que tus folículos sean demasiado sensibles, y con facilidad desencadena caspa y comezón, mientras dificulta el crecimiento capilar saludable.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_scalp'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'El entorno de tu cuero cabelludo es hostil para el correcto funcionamiento de los folículos capilares. A medida que la inflamación se extiende por el cuero cabelludo, tus folículos producen cada vez más sebo y caspa, creando un ambiente cada vez más tóxico que impide que funcionen.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Tus folículos están lidiando con demasiados problemas a la vez. Están dispersando su energía en exceso, lo que provoca un crecimiento débil del cabello y/o la caída prematura del que ya tienes.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares están tratando de lidiar con demasiados problemas a la vez. A medida que se van agotando, empiezan a fallar en todo, y eso hace que todos tus problemas empeoren al mismo tiempo.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Tus folículos están lidiando con demasiados problemas a la vez y no se toman un respiro. Están repartiendo su energía tan al límite que el crecimiento del cabello se debilita y el cabello que ya tienes se cae prematuramente.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares están lidiando con demasiados problemas al mismo tiempo. A medida que se van agotando, dejan que caiga más cabello, salen mechones más débiles y eso provoca que aparezcan nuevos problemas que se acumulan sobre los ya existentes.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_1consistent'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares son como una fábrica con maquinaria rota: siguen produciendo cabello, pero sale frágil y defectuoso. Esto te obliga a esforzarte aún más, pero obtienes menos resultados.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_keep-changing'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares son como una fábrica con maquinaria rota: todavía producen cabello, pero cada mechón sale frágil y defectuoso. Cada mechón nuevo es más débil que la anterior, porque los folículos ya no pueden construir una estructura capilar adecuada.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_come&go'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares son como una fábrica con maquinaria rota: siguen produciendo cabello, pero sale frágil y defectuoso. A veces la maquinaria funciona mejor que otras, y te deja días de buen cabello mezclados con días malos.';
                                } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        )) &&
                                    FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'problemDescription',
                                          answerIds: [
                                            'problemDescription_multiply'
                                          ],
                                        ))) {
                                  return 'Tus folículos capilares son como una fábrica con maquinaria rota: todavía están produciendo cabello, pero lo que sale es frágil y defectuoso. A medida que fallan más piezas del proceso de producción, se acumulan más tipos de cabello dañado.';
                                } else {
                                  return 'Tus folículos están lidiando con demasiados problemas a la vez y no se toman un respiro. Están repartiendo su energía tan al límite que el crecimiento del cabello se debilita y el cabello que ya tienes se cae prematuramente.';
                                }
                              }(),
                              'Your follicles are trying to handle too many problems at once. They\'re spreading their energy too thin across multiple issues, so they can\'t fully resolve any single problem. ',
                            ),
                            navigationTap: () async {
                              await actions.trackGAEvent(
                                'Continued From Pitch',
                                '',
                                'Damage HFD Pitch',
                                FFAppConstants.nonQuestionAnswerItem.toList(),
                                '',
                                '',
                              );
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model
                              .originProblemMultiChoiceWithImageQuestionCheckBoxModel,
                          updateCallback: () => safeSetState(() {}),
                          child: MultiChoiceWithImageQuestionCheckBoxWidget(
                            question:
                                '¿Has experimentado alguno de los siguientes en los últimos 6 meses?',
                            questionId: 'originProblen',
                            answerList: FFAppState().originProblem,
                            navigationTap: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      answerIds: _model
                                          .originProblemMultiChoiceWithImageQuestionCheckBoxModel
                                          .selectedAnswer,
                                      questionId: _model
                                          .originProblemMultiChoiceWithImageQuestionCheckBoxModel
                                          .questionId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.mirrorRatingQuestionOptionsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: RatingQuestionOptionsWidget(
                            question:
                                'Mi reflejo en el espejo afecta mi estado de ánimo y mi autoestima.',
                            subQuestion:
                                '¿Qué tanto te identificas con la siguiente afirmación?',
                            questionId: 'confidence',
                            buttonAction: () async {
                              await actions.trackGAEvent(
                                'Question Answered',
                                _model.mirrorRatingQuestionOptionsModel
                                    .questionId,
                                _model
                                    .mirrorRatingQuestionOptionsModel.question,
                                _model.mirrorRatingQuestionOptionsModel
                                    .selectedAnswer
                                    .toList(),
                                '',
                                '',
                              );
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .mirrorRatingQuestionOptionsModel
                                          .questionId,
                                      answerIds: _model
                                          .mirrorRatingQuestionOptionsModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.compareRatingQuestionOptionsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: RatingQuestionOptionsWidget(
                            question:
                                'Suelo comparar mi cabello con el de otras personas y eso me frustra.',
                            subQuestion:
                                '¿Qué tanto te identificas con la siguiente afirmación?',
                            questionId: 'comparison',
                            buttonAction: () async {
                              await actions.trackGAEvent(
                                'Question Answered',
                                _model.compareRatingQuestionOptionsModel
                                    .questionId,
                                _model
                                    .compareRatingQuestionOptionsModel.question,
                                _model.compareRatingQuestionOptionsModel
                                    .selectedAnswer
                                    .toList(),
                                '',
                                '',
                              );
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .compareRatingQuestionOptionsModel
                                          .questionId,
                                      answerIds: _model
                                          .compareRatingQuestionOptionsModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.professionalQuestionAnswerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: QuestionAnswerWidget(
                            question: '¿Fuiste referida por un profesional?',
                            answerList: FFAppState().professionalReferral,
                            answerAction: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .professionalQuestionAnswerModel
                                          .questionId,
                                      answerIds: _model
                                          .professionalQuestionAnswerModel
                                          .selectedAnswer,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.loadingScreenBeforeResultModel,
                          updateCallback: () => safeSetState(() {}),
                          child: LoadingScreenBeforeResultWidget(
                            title: FFLocalizations.of(context).getText(
                              '44639e0e' /* Creando tu programa de cuidado... */,
                            ),
                            carouselImageList: FFAppState().imageList,
                            checkPointList: FFAppState().beforeLoadingData,
                            autoNavigation: () async {
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.loginComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: LoginComponentWidget(
                            progressBarValue: 90.0,
                            concernResolutionChance: valueOrDefault<String>(
                              'Probabilidad de que arregles tu${valueOrDefault<String>(
                                () {
                                  if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_hairloss'],
                                      ))) {
                                    return 'caída del cabello';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_splitends'],
                                      ))) {
                                    return 'puntas abiertas';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_scalp'],
                                      ))) {
                                    return 'problemas del cuero cabelludo';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_damage'],
                                      ))) {
                                    return 'cabello dañado';
                                  } else {
                                    return 'Problemas del cabello';
                                  }
                                }(),
                                'hair problems',
                              )} en 14 días:',
                              'Probability to reduce your hair problems in 14 days',
                            ),
                            submitAction: () async {
                              _model.capitalisedName =
                                  await actions.convertToTitleCase(
                                _model.loginComponentModel
                                    .nameTextFieldTextController.text,
                              );
                              FFAppState().updateSubmittedContactDetailsStruct(
                                (e) => e
                                  ..name = _model.capitalisedName
                                  ..email = _model.loginComponentModel
                                      .emailTextFieldTextController.text,
                              );
                              safeSetState(() {});
                              await actions.webhookCallQuizProfile();
                              await actions.webhookCallcvg();
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );

                              safeSetState(() {});
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dashboardModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DashboardWidget(
                            name: FFAppState().submittedContactDetails.name,
                            percentage: valueOrDefault<int>(
                              random_data.randomInteger(92, 97),
                              97,
                            ),
                            description: FFLocalizations.of(context).getText(
                              'v1fdv9fv' /* ewew */,
                            ),
                            goal: FFLocalizations.of(context).getText(
                              'k5vkwbbc' /* test */,
                            ),
                            startDate: getCurrentTimestamp,
                            subHeading: FFLocalizations.of(context).getText(
                              'iid43xdb' /* ¡Eres la candidata perfecta pa... */,
                            ),
                            startMyChallengeAction: () async {
                              FFAppState().showResultPageredirectLoader = true;
                              safeSetState(() {});
                              await actions.trackGAEvent(
                                'Go to  checkout',
                                '',
                                'Result Page',
                                FFAppConstants.nonQuestionAnswerItem.toList(),
                                '',
                                '',
                              );
                              await actions.redirectToCheckout();
                            },
                            reserveMySeatAction: () async {
                              FFAppState().showResultPageredirectLoader = true;
                              safeSetState(() {});
                              await actions.trackGAEvent(
                                'Go to  checkout',
                                '',
                                'Result Page',
                                FFAppConstants.nonQuestionAnswerItem.toList(),
                                '',
                                '',
                              );
                              await actions.redirectToCheckout();
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.finalPitchModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FinalPitchWidget(
                            previousDiscountPercentage: 30,
                            discountPercentage: 85,
                          ),
                        ),
                        Visibility(
                          visible: responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ),
                          child: wrapWithModel(
                            model: _model.startLoadingComponentModel,
                            updateCallback: () => safeSetState(() {}),
                            child: StartLoadingComponentWidget(
                              navigation: () async {
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model:
                              _model.holisticQuestionAnswerAdditionlInfoModel,
                          updateCallback: () => safeSetState(() {}),
                          child: QuestionAnswerAdditionlInfoWidget(
                            question:
                                '¿Crees que tus problemas capilares podrían estar influenciados por factores más allá de solo productos?',
                            answerList: FFAppState().mindsetState,
                            answerAction: () async {
                              await actions.trackGAEvent(
                                'Question Answered',
                                _model.holisticQuestionAnswerAdditionlInfoModel
                                    .questionId,
                                _model.holisticQuestionAnswerAdditionlInfoModel
                                    .question,
                                _model.holisticQuestionAnswerAdditionlInfoModel
                                    .answerId
                                    .toList(),
                                '',
                                '',
                              );
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .holisticQuestionAnswerAdditionlInfoModel
                                          .questionId,
                                      answerIds: _model
                                          .holisticQuestionAnswerAdditionlInfoModel
                                          .answerId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                            },
                          ),
                        ),
                        Builder(
                          builder: (context) => wrapWithModel(
                            model: _model.goalImageBackgroundQuesBodyV3Model,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageBackgroundQuesBodyV3Widget(
                              question:
                                  'Descubre si el Reto es adecuado para ti y tu perfil capilar',
                              answer1: '',
                              answer2: '',
                              logoShow: true,
                              answerImage1: '',
                              answerImage2: '',
                              answer3: '',
                              questionId: 'hairGoal',
                              aswerImage3:
                                  'https://cdn.prod.website-files.com/62cbaa353a301eb715aa33d0/62cbaa353a301e2df7aa36c9_sarah-tran-holiniq-hairqare-2.webp',
                              answerList: FFAppState().diagnosisFD,
                              skipAction: () async {
                                await actions.trackGAEvent(
                                  'Opened Skip Dialog',
                                  '',
                                  '',
                                  FFAppConstants.nonQuestionAnswerItem.toList(),
                                  '',
                                  '',
                                );
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: SkipDialogWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              checkBoxToggleOn: () async {},
                              checkBoxToggleOff: () async {},
                              answerAction1: () async {
                                FFAppState().updateQuizProfileStruct(
                                  (e) => e
                                    ..updateQaPairs(
                                      (e) => e.add(QuestionAnswerPairStruct(
                                        questionId: _model
                                            .goalImageBackgroundQuesBodyV3Model
                                            .questionId,
                                        answerIds: ['goal_hairloss'],
                                      )),
                                    ),
                                );
                                safeSetState(() {});
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              answerAction2: () async {
                                FFAppState().updateQuizProfileStruct(
                                  (e) => e
                                    ..updateQaPairs(
                                      (e) => e.add(QuestionAnswerPairStruct(
                                        questionId: _model
                                            .goalImageBackgroundQuesBodyV3Model
                                            .questionId,
                                        answerIds: ['goal_betterhair'],
                                      )),
                                    ),
                                );
                                safeSetState(() {});
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              answerAction3: () async {
                                FFAppState().updateQuizProfileStruct(
                                  (e) => e
                                    ..updateQaPairs(
                                      (e) => e.add(QuestionAnswerPairStruct(
                                        questionId: _model
                                            .goalImageBackgroundQuesBodyV3Model
                                            .questionId,
                                        answerIds: ['goal_both'],
                                      )),
                                    ),
                                );
                                safeSetState(() {});
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if ((FFAppState().quizIndex == null) ||
                    (FFAppState().quizIndex < 0))
                  wrapWithModel(
                    model: _model.footerButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: FooterButtonWidget(
                      buttonOnTap: () async {
                        await _model.pageViewController?.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Opacity(
                    opacity: 0.0,
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'f1qq20i3' /* 🤓 🫧 🧖‍♀️ 🌿🤷‍♀️🙌😢😥🔒🔐�... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 1.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
