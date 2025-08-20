import '/backend/schema/structs/index.dart';
import '/components/floating_timer_checkout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key,
    required this.name,
    required this.percentage,
    required this.description,
    required this.goal,
    required this.startMyChallengeAction,
    required this.startDate,
    required this.reserveMySeatAction,
    String? subHeading,
  }) : this.subHeading =
            subHeading ?? 'You are a perfect fit for the Haircare Challenge 😍';

  final String? name;
  final int? percentage;
  final String? description;
  final String? goal;

  /// Button Tap of the Start My challenge.
  final Future Function()? startMyChallengeAction;

  /// Start My Challenge Date
  final DateTime? startDate;

  /// Button on tap of the Reserve My Action
  final Future Function()? reserveMySeatAction;

  final String subHeading;

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.trackGAEvent(
        'Viewed Results Page',
        '',
        'Result Page',
        FFAppConstants.nonQuestionAnswerItem.toList(),
        '',
        '',
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: ClipRRect(
        child: Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 500.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return double.infinity;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 500.0;
            } else {
              return 500.0;
            }
          }(),
          constraints: BoxConstraints(
            maxWidth: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 500.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return double.infinity;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 500.0;
              } else {
                return 500.0;
              }
            }(),
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryWhite,
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    20.0,
                    valueOrDefault<double>(
                      FFAppConstants.templateTopPadding,
                      0.0,
                    ),
                    20.0,
                    0.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            '¡Felicidades!${valueOrDefault<String>(
                              FFAppState().submittedContactDetails.name,
                              '🎉',
                            )}!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF1E191D),
                                  fontSize:
                                      MediaQuery.sizeOf(context).width < 340.0
                                          ? 20.0
                                          : 27.0,
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
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 25.0),
                        child: Text(
                          widget.subHeading,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF1E191D),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width < 340.0
                                            ? 20.0
                                            : 27.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 180.0,
                        constraints: BoxConstraints(
                          minHeight: 150.0,
                          maxHeight: 300.0,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFF2B485),
                              FlutterFlowTheme.of(context).tertiary
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                          border: Border.all(
                            color: Color(0x354008E0),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '26c1jnac' /* Tu puntuación de compatibilida... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      height: 30.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 300.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: LinearPercentIndicator(
                                        percent: 0.9,
                                        lineHeight: 30.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: Color(0xFF2AA331),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        barRadius: Radius.circular(50.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      '${valueOrDefault<String>(
                                        widget.percentage?.toString(),
                                        '90',
                                      )}%',
                                      '90',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF2AA331),
                                          fontSize:
                                              MediaQuery.sizeOf(context).width <
                                                      350.0
                                                  ? 20.0
                                                  : 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                valueOrDefault<String>(
                                  '${() {
                                    if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_hairloss'],
                                        ))) {
                                      return '9 de cada 10 mujeres con esta puntuación dijeron que su caída del cabello se detuvo, y empezaron a notar cabello nuevo después de la 14 Day Haircare Challenge.';
                                    } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_splitends'],
                                        ))) {
                                      return '9 de cada 10 mujeres con este puntaje compartieron que su cabello se sentía más suave, más saludable y que se veía mejor después del challenge.';
                                    } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_mixed'],
                                        ))) {
                                      return '9 de cada 10 mujeres con esta puntuación compartieron que su caída del cabello se detuvo, y que su cabello se veía y se sentía mejor después del challenge.';
                                    } else if (FFAppState()
                                        .quizProfile
                                        .qaPairs
                                        .contains(QuestionAnswerPairStruct(
                                          questionId: 'hairConcern',
                                          answerIds: ['concern_damage'],
                                        ))) {
                                      return '9 de cada 10 mujeres con esta puntuación compartieron que su cabello se sentía más suave, más saludable y se veía mejor después del reto.';
                                    } else {
                                      return '9 de cada 10 mujeres con esta puntuación compartieron que se detuvo la caída del cabello y que su cabello se veía y se sentía mejor después del reto.';
                                    }
                                  }()}',
                                  '9 out of 10 women with this score said their shedding stopped, and their hair looked and felt better after the challenge.',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).alternate,
                              Color(0xFFC4D0FF)
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                          border: Border.all(
                            color: Color(0x354008E0),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 2.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child: Container(
                                            width: 80.0,
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.network(
                                                valueOrDefault<String>(
                                                  () {
                                                    if (FFAppState()
                                                        .quizProfile
                                                        .qaPairs
                                                        .contains(
                                                            QuestionAnswerPairStruct(
                                                          questionId: 'age',
                                                          answerIds: [
                                                            'age_18to29'
                                                          ],
                                                        ))) {
                                                      return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66b37050731caef7208325c3_Under%2018.svg';
                                                    } else if (FFAppState()
                                                        .quizProfile
                                                        .qaPairs
                                                        .contains(
                                                            QuestionAnswerPairStruct(
                                                          questionId: 'age',
                                                          answerIds: [
                                                            'age_30to39'
                                                          ],
                                                        ))) {
                                                      return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66b3705002a6a9516930e533_25-34.svg';
                                                    } else if (FFAppState()
                                                        .quizProfile
                                                        .qaPairs
                                                        .contains(
                                                            QuestionAnswerPairStruct(
                                                          questionId: 'age',
                                                          answerIds: [
                                                            'age_40to49'
                                                          ],
                                                        ))) {
                                                      return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66b3705003f42517011b493e_35-44.svg';
                                                    } else if (FFAppState()
                                                        .quizProfile
                                                        .qaPairs
                                                        .contains(
                                                            QuestionAnswerPairStruct(
                                                          questionId: 'age',
                                                          answerIds: [
                                                            'age_50+'
                                                          ],
                                                        ))) {
                                                      return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66b370508968423fab443088_45%2B.svg';
                                                    } else {
                                                      return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66b3705002a6a9516930e533_25-34.svg';
                                                    }
                                                  }(),
                                                  'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66b37050731caef7208325c3_Under%2018.svg',
                                                ),
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 2.0),
                                          child: Text(
                                            FFAppState()
                                                .submittedContactDetails
                                                .name,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              () {
                                                if (FFAppState()
                                                    .quizProfile
                                                    .qaPairs
                                                    .contains(
                                                        QuestionAnswerPairStruct(
                                                      questionId: 'age',
                                                      answerIds: ['age_18to29'],
                                                    ))) {
                                                  return 'Edad: 20s';
                                                } else if (FFAppState()
                                                    .quizProfile
                                                    .qaPairs
                                                    .contains(
                                                        QuestionAnswerPairStruct(
                                                      questionId: 'age',
                                                      answerIds: ['age_30to39'],
                                                    ))) {
                                                  return 'Edad: 30s';
                                                } else if (FFAppState()
                                                    .quizProfile
                                                    .qaPairs
                                                    .contains(
                                                        QuestionAnswerPairStruct(
                                                      questionId: 'age',
                                                      answerIds: ['age_40to49'],
                                                    ))) {
                                                  return 'Edad: 40s';
                                                } else if (FFAppState()
                                                    .quizProfile
                                                    .qaPairs
                                                    .contains(
                                                        QuestionAnswerPairStruct(
                                                      questionId: 'age',
                                                      answerIds: ['age_50+'],
                                                    ))) {
                                                  return 'Edad: 50+';
                                                } else {
                                                  return 'Resumen';
                                                }
                                              }(),
                                              'Summary',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 130.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            () {
                                              if (FFAppState()
                                                  .quizProfile
                                                  .qaPairs
                                                  .contains(
                                                      QuestionAnswerPairStruct(
                                                    questionId: 'hairConcern',
                                                    answerIds: [
                                                      'concern_hairloss'
                                                    ],
                                                  ))) {
                                                return 'FOLÍCULOS CAPILARES SECUESTRADOS';
                                              } else if (FFAppState()
                                                  .quizProfile
                                                  .qaPairs
                                                  .contains(
                                                      QuestionAnswerPairStruct(
                                                    questionId: 'hairConcern',
                                                    answerIds: [
                                                      'concern_damage'
                                                    ],
                                                  ))) {
                                                return 'FOLÍCULOS CAPILARES DEFECTUOSOS';
                                              } else if (FFAppState()
                                                  .quizProfile
                                                  .qaPairs
                                                  .contains(
                                                      QuestionAnswerPairStruct(
                                                    questionId: 'hairConcern',
                                                    answerIds: [
                                                      'concern_splitends'
                                                    ],
                                                  ))) {
                                                return 'FOLÍCULOS CAPILARES DEFECTUOSOS';
                                              } else if (FFAppState()
                                                  .quizProfile
                                                  .qaPairs
                                                  .contains(
                                                      QuestionAnswerPairStruct(
                                                    questionId: 'hairConcern',
                                                    answerIds: [
                                                      'concern_scalp'
                                                    ],
                                                  ))) {
                                                return 'FOLICULOS CAPILARES INFLAMADOS';
                                              } else if (FFAppState()
                                                  .quizProfile
                                                  .qaPairs
                                                  .contains(
                                                      QuestionAnswerPairStruct(
                                                    questionId: 'hairConcern',
                                                    answerIds: [
                                                      'concern_mixed'
                                                    ],
                                                  ))) {
                                                return 'FOLÍCULOS CAPILARES SOBRECARGADOS';
                                              } else {
                                                return 'FOLÍCULOS CAPILARES SOBRECARGADOS';
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 5.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_hairloss'
                                                        ],
                                                      ))) {
                                                    return 'Para lograr un cabello grueso y abundante que crece con facilidad:';
                                                  } else if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_splitends'
                                                        ],
                                                      ))) {
                                                    return 'Para lograr un cabello fuerte y hermoso, que sea fácil de cuidar:';
                                                  } else if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_scalp'
                                                        ],
                                                      ))) {
                                                    return 'Para sanar tu cuero cabelludo y recuperar el brillo del cabello:';
                                                  } else if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_damage'
                                                        ],
                                                      ))) {
                                                    return 'Para tener un cabello más fuerte que puedas peinar y teñir:';
                                                  } else {
                                                    return 'Para tener un cabello grueso y saludable, fácil de cuidar:';
                                                  }
                                                }(),
                                                'To get beautiful hair, easy to care for:',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF1E191D),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_hairloss'
                                                        ],
                                                      ))) {
                                                    return 'Reduce todos los factores de estrés ocultos. Aplica un cuidado específico que llegue a la inflamación del folículo capilar para reactivar el crecimiento del cabello.';
                                                  } else if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_splitends'
                                                        ],
                                                      ))) {
                                                    return 'Reduce todos los factores de estrés ocultos. Corrige el proceso de crecimiento capilar a nivel de los folículos capilares con productos y prácticas específicas.';
                                                  } else if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_scalp'
                                                        ],
                                                      ))) {
                                                    return 'Reduce todos los factores inflamatorios ocultos. Ofrece un cuidado específico para equilibrar el ambiente del cuero cabelludo y restaurar un crecimiento capilar saludable.';
                                                  } else if (FFAppState()
                                                      .quizProfile
                                                      .qaPairs
                                                      .contains(
                                                          QuestionAnswerPairStruct(
                                                        questionId:
                                                            'hairConcern',
                                                        answerIds: [
                                                          'concern_damage'
                                                        ],
                                                      ))) {
                                                    return 'Reduce todos los factores de estrés ocultos. Corrige tu proceso de crecimiento capilar a nivel del folículo con productos y prácticas específicas.';
                                                  } else {
                                                    return 'Reduce todos los factores de estrés ocultos. Reinicia el proceso de crecimiento capilar a nivel de los folículos con productos y prácticas específicas.';
                                                  }
                                                }(),
                                                'Reduce todos los factores de estrés ocultos. Reinicia el proceso de crecimiento capilar a nivel de los folículos con productos y prácticas específicas.',
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF1E191D),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'aq4pinvd' /* Tu línea de tiempo de transfor... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 90.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 120.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 120.0;
                                  } else {
                                    return 120.0;
                                  }
                                }(),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    image: Image.network(
                                      valueOrDefault<String>(
                                        () {
                                          if (FFAppState()
                                              .quizProfile
                                              .qaPairs
                                              .contains(
                                                  QuestionAnswerPairStruct(
                                                questionId: 'hairConcern',
                                                answerIds: ['concern_hairloss'],
                                              ))) {
                                            return 'https://assets.hairqare.co/RP%20Hairloss.webp';
                                          } else if (FFAppState()
                                              .quizProfile
                                              .qaPairs
                                              .contains(
                                                  QuestionAnswerPairStruct(
                                                questionId: 'hairConcern',
                                                answerIds: [
                                                  'concern_splitends'
                                                ],
                                              ))) {
                                            return 'https://assets.hairqare.co/RP%20Split%20ends.webp';
                                          } else if (FFAppState()
                                              .quizProfile
                                              .qaPairs
                                              .contains(
                                                  QuestionAnswerPairStruct(
                                                questionId: 'hairConcern',
                                                answerIds: ['concern_scalp'],
                                              ))) {
                                            return 'https://assets.hairqare.co/RP%20Dandruff.webp';
                                          } else if (FFAppState()
                                              .quizProfile
                                              .qaPairs
                                              .contains(
                                                  QuestionAnswerPairStruct(
                                                questionId: 'hairConcern',
                                                answerIds: ['concern_damage'],
                                              ))) {
                                            return 'https://assets.hairqare.co/RP%20Damage.webp';
                                          } else {
                                            return 'https://assets.hairqare.co/RP%20Others.webp';
                                          }
                                        }(),
                                        'https://assets.hairqare.co/RP%20Others.webp',
                                      ),
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      () {
                                        if (FFAppState()
                                            .quizProfile
                                            .qaPairs
                                            .contains(QuestionAnswerPairStruct(
                                              questionId: 'hairConcern',
                                              answerIds: ['concern_hairloss'],
                                            ))) {
                                          return 'https://assets.hairqare.co/RP%20hairloss%20timeline.webp';
                                        } else if (FFAppState()
                                            .quizProfile
                                            .qaPairs
                                            .contains(QuestionAnswerPairStruct(
                                              questionId: 'hairConcern',
                                              answerIds: ['concern_splitends'],
                                            ))) {
                                          return 'https://assets.hairqare.co/RP%20Split%20ends%20timeline.webp';
                                        } else if (FFAppState()
                                            .quizProfile
                                            .qaPairs
                                            .contains(QuestionAnswerPairStruct(
                                              questionId: 'hairConcern',
                                              answerIds: ['concern_scalp'],
                                            ))) {
                                          return 'https://assets.hairqare.co/RP%20dandruff%20timeline.webp';
                                        } else if (FFAppState()
                                            .quizProfile
                                            .qaPairs
                                            .contains(QuestionAnswerPairStruct(
                                              questionId: 'hairConcern',
                                              answerIds: ['concern_damage'],
                                            ))) {
                                          return 'https://assets.hairqare.co/RP%20damage%20timeline.webp';
                                        } else {
                                          return 'https://assets.hairqare.co/RP%20others%20timeline.webp';
                                        }
                                      }(),
                                      'https://assets.hairqare.co/RP%20hairloss%20timeline.webp',
                                    ),
                                    width: double.infinity,
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 160.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 200.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 200.0;
                                      } else {
                                        return 200.0;
                                      }
                                    }(),
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment(0.0, -1.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 20.0),
                        child: Text(
                          'Te lo mereces, ${FFAppState().submittedContactDetails.name}!',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFFE6903),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          'Únete al Reto de Cuidado Capilar de 14 Días y y dile adiós a tu ${valueOrDefault<String>(
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
                                return 'problemas crónicos del cabello';
                              }
                            }(),
                            'problemas crónicos del cabello',
                          )}de forma permanente con una rutina que funcione.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF1E191D),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 20.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '7pj5156l' /* ¡Adiós a la frustración y a la... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    color: Color(0xFF1E191D),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'unnguajk' /* ✅ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gupt5mjs' /* Ataca las causas de raíz de tu... */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6gx8s01a' /* ✅ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'begqgauj' /* Crea un plan de cuidado capila... */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mdb5vygy' /* ✅ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'qopcc4n9' /* Crea tu propio shampoo y acond... */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 0.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 50.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 50.0;
                              } else {
                                return 50.0;
                              }
                            }(),
                            0.0,
                          ),
                          25.0,
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 0.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 50.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 50.0;
                              } else {
                                return 50.0;
                              }
                            }(),
                            0.0,
                          ),
                          25.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.reserveMySeatAction?.call();

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'tvn54o9f' /* ¡ÚNETE AL RETO! */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).orange,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(25.0),
                          hoverColor: Color(0xFFF67716),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 15.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '2cdo81nl' /* Más de 91 mil mujeres  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).orange,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'clhaelj4' /* han tomado este reto, y  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'fwse24sg' /* el 92% de quienes terminaron e... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).orange,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          20.0,
                          0.0,
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 0.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 20.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 20.0;
                              } else {
                                return 20.0;
                              }
                            }(),
                            0.0,
                          )),
                      child: Container(
                        width: 428.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x92E8EBFC),
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://assets.hairqare.co/Quiz-Result-Trustpilot-Snippet.webp',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 300.0,
                        child: CarouselSlider(
                          items: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                () {
                                  if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_splitends'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d3a9d2d4a61eaa91554b_Split%20ends%2C%20frizz%2C%20and%20dryness%20-%201%20testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_damage'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d23f22126707b71fc4b1_Damage%20Hair%20-%201%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_hairloss'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d09ec26442e4eeba9de4_Hair%20Loss%20-%201%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_scalp'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d1a61f17786b5fe9c712_Irritation%20or%20dandruff%20-%201%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_mixed'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d517d06ef1a809dce40d_Others%20-%201%20testimonial.webp';
                                  } else {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d517d06ef1a809dce40d_Others%20-%201%20testimonial.webp';
                                  }
                                }(),
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                () {
                                  if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_splitends'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d3aa31bd1db569a6668f_Split%20ends%2C%20frizz%2C%20and%20dryness%20-%202%20testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_damage'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d23fb0e5e3e5f96affda_Damage%20Hair%20-%202%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_hairloss'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d09e2543cd8a08757fb8_Hair%20Loss%20-%202%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_scalp'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d1a6065e8c25fcfd9225_Irritation%20or%20dandruff%20-%202%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_mixed'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d5170d7c144bc79e6b77_Others%20-%202%20testimonial.webp';
                                  } else {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d5170d7c144bc79e6b77_Others%20-%202%20testimonial.webp';
                                  }
                                }(),
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                () {
                                  if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_splitends'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d3a9e5e456e84ab2e151_Split%20ends%2C%20frizz%2C%20and%20dryness%20-%203%20testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_damage'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d240d2d4a61eaa9065c8_Damage%20Hair%20-%203%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_hairloss'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d09f2b94a250bd1383e2_Hair%20Loss%20-%203%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_scalp'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d1a6abdeb8fa540a7844_Irritation%20or%20dandruff%20-%203%20Testimonial.webp';
                                  } else if (FFAppState()
                                      .quizProfile
                                      .qaPairs
                                      .contains(QuestionAnswerPairStruct(
                                        questionId: 'hairConcern',
                                        answerIds: ['concern_mixed'],
                                      ))) {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d5172b94a250bd16bde1_Others%20-%203%20testimonial.webp';
                                  } else {
                                    return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/6683d5172b94a250bd16bde1_Others%20-%203%20testimonial.webp';
                                  }
                                }(),
                                width: 300.0,
                                height: 147.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66bf0ea5e58f4eb770a5edc3_3%20BH.webp',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66b36daaffa3823d4e54ba94_Better%20Hair%204.webp',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66bf0ea5ec6980538220a980_4%20BH.webp',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66bf363f53dec5e95dfda7f5_8%20HL.webp',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                          carouselController: _model.carouselController ??=
                              CarouselSliderController(),
                          options: CarouselOptions(
                            initialPage: 1,
                            viewportFraction: 0.8,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.25,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: false,
                            onPageChanged: (index, _) =>
                                _model.carouselCurrentIndex = index,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 0.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 50.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 50.0;
                              } else {
                                return 50.0;
                              }
                            }(),
                            0.0,
                          ),
                          20.0,
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 0.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 50.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 50.0;
                              } else {
                                return 50.0;
                              }
                            }(),
                            0.0,
                          ),
                          20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.reserveMySeatAction?.call();
                        },
                        text: FFLocalizations.of(context).getText(
                          'phsineyb' /* COMENZAR MI RETO */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).orange,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(25.0),
                          hoverColor: Color(0xFFF67716),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 20.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'x0h469el' /* Según tus respuestas, solo nec... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'u03zkhmn' /* 
10 minutos al día, durante 14... */
                                  ,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      lineHeight: 1.5,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'lxtttebt' /*  para lucir un cabello hermoso... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1E191D),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      lineHeight: 1.4,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.3,
                                ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 320.0,
                      height: 420.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://assets.hairqare.co/Result%20Page-%20Days%20Images.webp',
                          width: 320.0,
                          height: 420.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'rpb2l5tr' /* 100% 
RESULTADOS */
                                  ,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryPlum,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7qu4hw6f' /* 0%
ROLLOS */
                                  ,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryPlum,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 1.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Group_(8).png',
                                                width: 30.0,
                                                height: 30.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'on4egm7h' /* Basado en la ciencia y  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF1E191D),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5zr2seie' /* revisado por expertos en el cu... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF1E191D),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Group_(9).png',
                                                width: 30.0,
                                                height: 30.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '7t1iikxr' /* Obtén un  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF1E191D),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hv2znn3j' /* un plan de alimentación rico e... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF1E191D),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'q9istz0v' /* para minimizar la caída del ca... */,
                                                  ),
                                                  style: TextStyle(
                                                    color: Color(0xFF1E191D),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Icons_(1).png',
                                                width: 30.0,
                                                height: 30.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'yqzvlhso' /* Ahorra miles de pesos  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF1E191D),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '16qkzkbg' /* en productos y tratamientos de... */,
                                                  ),
                                                  style: TextStyle(
                                                    color: Color(0xFF1E191D),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 10.0))
                                .addToEnd(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: Container(
                          width: 600.0,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    () {
                                      if (FFAppState()
                                          .quizProfile
                                          .qaPairs
                                          .contains(QuestionAnswerPairStruct(
                                            questionId: 'hairConcern',
                                            answerIds: ['concern_splitends'],
                                          ))) {
                                        return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66c8403717c1885294257de6_Frizzy%20hair%20Testimonial%20Result%20Page%202.webp';
                                      } else if (FFAppState()
                                          .quizProfile
                                          .qaPairs
                                          .contains(QuestionAnswerPairStruct(
                                            questionId: 'hairConcern',
                                            answerIds: ['concern_damage'],
                                          ))) {
                                        return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66c8402237fd9f68f6532610_Color%20Damage%20Testimonial%20Result%20Page%201.webp';
                                      } else if (FFAppState()
                                          .quizProfile
                                          .qaPairs
                                          .contains(QuestionAnswerPairStruct(
                                            questionId: 'hairConcern',
                                            answerIds: ['concern_hairloss'],
                                          ))) {
                                        return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66c8412b13f435c278b09918_Hair%20Loss%20Testimonial%20Result%20Page%202.webp';
                                      } else if (FFAppState()
                                          .quizProfile
                                          .qaPairs
                                          .contains(QuestionAnswerPairStruct(
                                            questionId: 'hairConcern',
                                            answerIds: ['concern_scalp'],
                                          ))) {
                                        return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66c840fec3d7ba7a98f73c5e_Dandruff%20Testimonial%20Result%20Page%201.webp';
                                      } else {
                                        return 'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66c8414cec3e40bd589807db_Other%20issues%20Testimonial%20Result%20Page%201.webp';
                                      }
                                    }(),
                                    'https://uploads-ssl.webflow.com/62cbaa353a301eb715aa33d0/66c8414cec3e40bd589807db_Other%20issues%20Testimonial%20Result%20Page%201.webp',
                                  ),
                                  width: 350.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ].divide(SizedBox(height: 0.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 15.0),
                        child: Text(
                          'Quedan solo ${valueOrDefault<String>(
                            random_data.randomInteger(3, 9).toString(),
                            '7',
                          )} lugares. ¡Date prisa!',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF1E191D),
                                    fontSize: 16.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 0.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 50.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 50.0;
                                        } else {
                                          return 50.0;
                                        }
                                      }(),
                                      0.0,
                                    ),
                                    0.0,
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 0.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 50.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 50.0;
                                        } else {
                                          return 50.0;
                                        }
                                      }(),
                                      0.0,
                                    ),
                                    0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await widget.reserveMySeatAction?.call();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '8p79eqjq' /* COMENZAR MI RETO */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).orange,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(25.0),
                                    hoverColor: Color(0xFFF67716),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '6kg20sml' /* Garantía de reembolso del 100%... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryPeriwinkle,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 100.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await actions.trackGAEvent(
                            'Played VSL',
                            '',
                            'Result Page',
                            FFAppConstants.nonQuestionAnswerItem.toList(),
                            '',
                            '',
                          );
                        },
                        child: FlutterFlowYoutubePlayer(
                          url: 'https://youtube.com/watch?v=rul244vxNec',
                          width: double.infinity,
                          autoPlay: false,
                          looping: true,
                          mute: false,
                          showControls: true,
                          showFullScreen: true,
                          strictRelatedVideos: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (valueOrDefault<bool>(
                FFAppState().showResultPageredirectLoader,
                false,
              ))
                AnimatedOpacity(
                  opacity: 0.7,
                  duration: 190.0.ms,
                  curve: Curves.easeInOut,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Lottie.network(
                        'https://lottie.host/016d1410-f58a-4084-ab24-042294afa7b8/aInCgIkJOA.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                  ),
                ),
              wrapWithModel(
                model: _model.floatingTimerCheckoutModel,
                updateCallback: () => safeSetState(() {}),
                child: FloatingTimerCheckoutWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
