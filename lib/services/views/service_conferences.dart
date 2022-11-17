import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

import 'package:gadbeni/services/widgets/card_services_list.dart';

class ServiceConferences extends StatefulWidget {
  String url = "";
  ServiceConferences(this.url);
  @override
  State<ServiceConferences> createState() => _ServiceConferencesState(url: url);
}

class _ServiceConferencesState extends State<ServiceConferences> {
  String url = '';
  _ServiceConferencesState({Key? key, required this.url});

  // final serverText = TextEditingController();
  var roomText = TextEditingController();
  final userDisplayNameText = TextEditingController();
  final userAvatarUrlText = TextEditingController();

  bool isAudioMuted = true;
  bool isAudioOnly = false;
  bool isVideoMuted = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      roomText = TextEditingController(text: this.url);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de servicios"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10.0),
                // _buildTextField(
                //   labelText: "Server URL",
                //   controller: serverText,
                //   hintText: "Hint: Leave empty for meet.jitsi.si",
                // ),
                const SizedBox(height: 10.0),
                _buildTextField(
                    labelText: "URL de la reunión",
                    controller: roomText,
                    hintText:
                        "https://conferencias.beni.gob.bo/meet/conferencia-1"),
                const SizedBox(height: 10.0),
                _buildTextField(
                    labelText: "Tu nombre",
                    controller: userDisplayNameText,
                    hintText: "Juan P."),
                const SizedBox(height: 10.0),
                CheckboxListTile(
                  title: const Text("Audio silenciado"),
                  value: isAudioMuted,
                  onChanged: _onAudioMutedChanged,
                ),
                const SizedBox(height: 10.0),
                CheckboxListTile(
                  title: const Text("Solo audio"),
                  value: isAudioOnly,
                  onChanged: _onAudioOnlyChanged,
                ),
                const SizedBox(height: 10.0),
                CheckboxListTile(
                  title: const Text("Video apagado"),
                  value: isVideoMuted,
                  onChanged: _onVideoMutedChanged,
                ),
                const Divider(height: 48.0, thickness: 2.0),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () => _joinMeeting(),
                    child: const Text(
                      "Unirse ahora",
                      style: TextStyle(color: Colors.white),
                    ),
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateColor.resolveWith(
                    //       (states) => Colors.blue),
                    // ),
                  ),
                ),
                const SizedBox(height: 48.0),
              ],
            ),
          ),
        ));
  }

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value!;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value!;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value!;
    });
  }

  _joinMeeting() async {
    // String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    Map<FeatureFlag, Object> featureFlags = {};

    // Define meetings options here
    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomText.text,
      // serverUrl: serverUrl,
      isAudioMuted: isAudioMuted,
      isAudioOnly: isAudioOnly,
      isVideoMuted: isVideoMuted,
      userDisplayName: userDisplayNameText.text,
      userEmail: '',
      featureFlags: featureFlags,
    );

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
        },
        onAudioMutedChanged: (isMuted) {
          debugPrint("onAudioMutedChanged: isMuted: $isMuted");
        },
        onVideoMutedChanged: (isMuted) {
          debugPrint("onVideoMutedChanged: isMuted: $isMuted");
        },
        onScreenShareToggled: (participantId, isSharing) {
          debugPrint(
            "onScreenShareToggled: participantId: $participantId, "
            "isSharing: $isSharing",
          );
        },
        onParticipantJoined: (email, name, role, participantId) {
          debugPrint(
            "onParticipantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
        },
        onParticipantLeft: (participantId) {
          debugPrint("onParticipantLeft: participantId: $participantId");
        },
        onParticipantsInfoRetrieved: (participantsInfo, requestId) {
          debugPrint(
            "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
            "requestId: $requestId",
          );
        },
        onChatMessageReceived: (senderId, message, isPrivate) {
          debugPrint(
            "onChatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate",
          );
        },
        onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
        onClosed: () => debugPrint("onClosed"),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
    String? hintText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
