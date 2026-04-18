import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'new_chat_model.dart';
export 'new_chat_model.dart';

class NewChatWidget extends StatefulWidget {
  const NewChatWidget({super.key});

  @override
  State<NewChatWidget> createState() => _NewChatWidgetState();
}

class _NewChatWidgetState extends State<NewChatWidget> {
  late NewChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewChatModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.showFullList = true;
      safeSetState(() {});
      _model.chatData = await queryChatsRecordOnce(
        queryBuilder: (chatsRecord) => chatsRecord.where(
          'users',
          arrayContains: currentUserReference,
        ),
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 50.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      hintText: 'Search user...',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      suffixIcon: _model.textController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController?.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF848485),
                                size: 24.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'uid',
                      isNotEqualTo: currentUserUid,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> iconButtonUsersRecordList =
                        snapshot.data!;

                    return FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: Color(0xFF7C46F0),
                      icon: Icon(
                        Icons.person_search,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        safeSetState(() {
                          _model.simpleSearchResults = TextSearch(
                            iconButtonUsersRecordList
                                .map(
                                  (record) => TextSearchItem.fromTerms(record, [
                                    record.displayName!,
                                    record.email!,
                                    record.profession!,
                                    record.phoneNumber!
                                  ]),
                                )
                                .toList(),
                          )
                              .search(_model.textController.text)
                              .map((r) => r.object)
                              .toList();
                          ;
                        });
                        _model.showFullList = false;
                        _model.updatePage(() {});
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 12.0),
              child: Text(
                'Select Chat',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
          if (_model.showFullList)
            Expanded(
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) => usersRecord.where(
                    'uid',
                    isNotEqualTo: currentUserUid,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> listViewUsersRecordList = snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      30.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: listViewUsersRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewUsersRecord =
                          listViewUsersRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            if (_model.chatData?.length == 0) {
                              var chatsRecordReference1 =
                                  ChatsRecord.collection.doc();
                              await chatsRecordReference1.set({
                                ...createChatsRecordData(
                                  userA: listViewUsersRecord.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId:
                                      random_data.randomInteger(1, 10000),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [listViewUsersRecord.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              });
                              _model.chatref = ChatsRecord.getDocumentFromData({
                                ...createChatsRecordData(
                                  userA: listViewUsersRecord.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId:
                                      random_data.randomInteger(1, 10000),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [listViewUsersRecord.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              }, chatsRecordReference1);
                              _shouldSetState = true;

                              await _model.chatref!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'users': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });

                              context.pushNamed(
                                Chat2DetailsWidget.routeName,
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.chatref,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatRef': _model.chatref,
                                },
                              );
                            } else {
                              while (_model.count! < _model.chatData!.length) {
                                if ((listViewUsersRecord.reference ==
                                        _model.chatData
                                            ?.elementAtOrNull(_model.count!)
                                            ?.users
                                            ?.firstOrNull) ||
                                    (listViewUsersRecord.reference ==
                                        _model.chatData
                                            ?.elementAtOrNull(_model.count!)
                                            ?.users
                                            ?.lastOrNull)) {
                                  context.pushNamed(
                                    Chat2DetailsWidget.routeName,
                                    queryParameters: {
                                      'chatRef': serializeParam(
                                        _model.chatData
                                            ?.elementAtOrNull(_model.count!),
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatRef': _model.chatData
                                          ?.elementAtOrNull(_model.count!),
                                    },
                                  );

                                  Navigator.pop(context);
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  _model.count = _model.count! + 1;
                                  _model.updatePage(() {});
                                }
                              }

                              var chatsRecordReference2 =
                                  ChatsRecord.collection.doc();
                              await chatsRecordReference2.set({
                                ...createChatsRecordData(
                                  userA: listViewUsersRecord.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId: random_data.randomInteger(
                                      1000000, 9999999),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [listViewUsersRecord.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              });
                              _model.chatrefnew =
                                  ChatsRecord.getDocumentFromData({
                                ...createChatsRecordData(
                                  userA: listViewUsersRecord.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId: random_data.randomInteger(
                                      1000000, 9999999),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [listViewUsersRecord.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              }, chatsRecordReference2);
                              _shouldSetState = true;

                              await _model.chatrefnew!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'users': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });

                              context.pushNamed(
                                Chat2DetailsWidget.routeName,
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.chatrefnew,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatRef': _model.chatrefnew,
                                },
                              );
                            }

                            Navigator.pop(context);
                            if (_shouldSetState) safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            height: 72.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(14.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 55.0,
                                        height: 55.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            listViewUsersRecord.photoUrl,
                                            'https://picsum.photos/seed/402/600',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewUsersRecord.displayName,
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
                                                        fontSize: 16.0,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 0.0),
                                              child: Text(
                                                listViewUsersRecord.profession,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Color(0xFF848485),
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          if (!_model.showFullList)
            Expanded(
              child: Builder(
                builder: (context) {
                  final userSearch =
                      _model.simpleSearchResults.map((e) => e).toList();

                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      30.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: userSearch.length,
                    itemBuilder: (context, userSearchIndex) {
                      final userSearchItem = userSearch[userSearchIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            if (_model.chatData?.length == 0) {
                              var chatsRecordReference1 =
                                  ChatsRecord.collection.doc();
                              await chatsRecordReference1.set({
                                ...createChatsRecordData(
                                  userA: userSearchItem.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId:
                                      random_data.randomInteger(1, 10000),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [userSearchItem.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              });
                              _model.chatref2 =
                                  ChatsRecord.getDocumentFromData({
                                ...createChatsRecordData(
                                  userA: userSearchItem.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId:
                                      random_data.randomInteger(1, 10000),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [userSearchItem.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              }, chatsRecordReference1);
                              _shouldSetState = true;

                              await _model.chatref!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'users': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });

                              context.pushNamed(
                                Chat2DetailsWidget.routeName,
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.chatref,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatRef': _model.chatref,
                                },
                              );
                            } else {
                              while (_model.count! < _model.chatData!.length) {
                                if ((userSearchItem.reference ==
                                        _model.chatData
                                            ?.elementAtOrNull(_model.count!)
                                            ?.users
                                            ?.firstOrNull) ||
                                    (userSearchItem.reference ==
                                        _model.chatData
                                            ?.elementAtOrNull(_model.count!)
                                            ?.users
                                            ?.lastOrNull)) {
                                  context.pushNamed(
                                    Chat2DetailsWidget.routeName,
                                    queryParameters: {
                                      'chatRef': serializeParam(
                                        _model.chatData
                                            ?.elementAtOrNull(_model.count!),
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatRef': _model.chatData
                                          ?.elementAtOrNull(_model.count!),
                                    },
                                  );

                                  Navigator.pop(context);
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  _model.count = _model.count! + 1;
                                  _model.updatePage(() {});
                                }
                              }

                              var chatsRecordReference2 =
                                  ChatsRecord.collection.doc();
                              await chatsRecordReference2.set({
                                ...createChatsRecordData(
                                  userA: userSearchItem.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId: random_data.randomInteger(
                                      1000000, 9999999),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [userSearchItem.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              });
                              _model.chatrefnew2 =
                                  ChatsRecord.getDocumentFromData({
                                ...createChatsRecordData(
                                  userA: userSearchItem.reference,
                                  userB: currentUserReference,
                                  lastMessage: '',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                  groupChatId: random_data.randomInteger(
                                      1000000, 9999999),
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': [userSearchItem.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  },
                                ),
                              }, chatsRecordReference2);
                              _shouldSetState = true;

                              await _model.chatrefnew!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'users': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });

                              context.pushNamed(
                                Chat2DetailsWidget.routeName,
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.chatrefnew,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatRef': _model.chatrefnew,
                                },
                              );
                            }

                            Navigator.pop(context);
                            if (_shouldSetState) safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            height: 72.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(14.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 55.0,
                                        height: 55.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            userSearchItem.photoUrl,
                                            'https://picsum.photos/seed/402/600',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              userSearchItem.displayName,
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
                                                        fontSize: 16.0,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 0.0),
                                              child: Text(
                                                userSearchItem.profession,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Color(0xFF848485),
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
