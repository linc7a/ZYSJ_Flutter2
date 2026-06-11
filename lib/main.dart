import 'package:flutter/material.dart';

void main() {
  runApp(const ProfessionalPracticeAndroidApp());
}

class ProfessionalPracticeAndroidApp extends StatelessWidget {
  const ProfessionalPracticeAndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '专业实践 Android 真机运行展示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PracticeAndroidHomePage(),
    );
  }
}

class PracticeAndroidHomePage extends StatelessWidget {
  const PracticeAndroidHomePage({super.key});

  static const String projectTitle = '第 1 组 Flutter Android 真机协作验收展示';
  static const String projectSlogan =
      '用 Fork + Pull Request 完成协作修改，并把最终应用运行到真实 Android 手机';
  static const String deviceProof =
      '验收证据：PR 记录、Review 记录、adb / flutter devices 检查，以及第二部手机拍摄的手持真机运行照片。';

  static const List<TeamMember> members = [
    TeamMember(
      role: '组长',
      name: '组长',
      task: '创建 GitHub 原始仓库，维护 main 分支，审核并合并 4 名组员的 Pull Request',
    ),
    TeamMember(
      role: '组员 A',
      name: '组员 A',
      task: '修改应用标题和项目口号，说明本组 Android 真机运行实践主题',
    ),
    TeamMember(role: '组员 B', name: '组员 B', task: '完善小组成员信息与分工，确保每个人的协作任务清楚可查'),
    TeamMember(
      role: '组员 C',
      name: '组员 C',
      task: '补充 Android 真机运行检查步骤，覆盖 USB 调试、设备识别和 flutter run',
    ),
    TeamMember(
      role: '组员 D',
      name: '组员 D',
      task: '补充真机照片证据要求，并维护 README 中的照片路径与展示说明',
    ),
  ];

  static const List<String> androidTasks = [
    '确认主运行电脑已安装 Flutter SDK、Android Studio、Android SDK、Platform-Tools 和 Git',
    '把项目放在短英文路径中，先执行 flutter pub get、flutter analyze 和 flutter test',
    '连接真实 Android 手机，开启开发者选项、USB 调试，并选择文件传输 / MTP 模式',
    '执行 adb devices，确认设备状态是 device；如果是 unauthorized，需要在手机上允许 USB 调试',
    '执行 flutter devices，确认 Flutter 能识别到 Android 真机设备',
    '执行 flutter run 或 flutter run -d 设备ID，把最终版本运行到真实 Android 手机',
    '运行成功后，用第二部手机拍摄手持真机运行照片，并保存到 images/android-real-device.jpg',
  ];

  static const List<String> evidenceNotes = [
    '照片必须显示真实 Android 手机正在运行本 Flutter 应用。',
    '不能用 Web 截图、模拟器截图或手机直接截图代替真机照片。',
    '必须由第二部手机拍摄，并拍到手持手机的真实场景。',
    '照片中不能包含 token、账号密码、聊天记录或其他明显隐私信息。',
    '照片文件必须放入 images/android-real-device.jpg，并在 GitHub README 中使用相对路径显示。',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('专业实践 Android 真机运行')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          AndroidTasksSection(),
          SizedBox(height: 20),
          EvidenceSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.phone_android, size: 42, color: Colors.teal),
            SizedBox(height: 12),
            Text(
              PracticeAndroidHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              PracticeAndroidHomePage.projectSlogan,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              PracticeAndroidHomePage.deviceProof,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '小组成员与分工',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...PracticeAndroidHomePage.members.map(
          (member) => MemberCard(member: member),
        ),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class AndroidTasksSection extends StatelessWidget {
  const AndroidTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Android 真机运行任务',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...PracticeAndroidHomePage.androidTasks.map(
              (task) => Text('• $task'),
            ),
          ],
        ),
      ),
    );
  }
}

class EvidenceSection extends StatelessWidget {
  const EvidenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '真机照片证据要求',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...PracticeAndroidHomePage.evidenceNotes.map(
              (note) => Text('• $note'),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({
    required this.role,
    required this.name,
    required this.task,
  });

  final String role;
  final String name;
  final String task;
}
