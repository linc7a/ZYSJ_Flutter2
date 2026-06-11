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

  static const String projectTitle = '第 2 组专业实践 Android 真机运行展示';
  static const String projectSlogan = 'Flutter 跨端协作成果，成功部署到 Android 真机';
  static const String deviceProof = '最终证据：用第二部手机拍摄手持 Android 真机运行照片，并加入 GitHub README。';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '张组长', task: '创建原始仓库、维护 main、审核 PR、组织主电脑和主手机完成真机运行'),
    TeamMember(role: '组员 A', name: '成员 A', task: '修改 projectTitle 和 projectSlogan，体现本组实践主题'),
    TeamMember(role: '组员 B', name: '成员 B', task: '补充 members 中的小组成员姓名与分工'),
    TeamMember(role: '组员 C', name: '成员 C', task: '补充 androidTasks 中的真机运行检查任务'),
    TeamMember(role: '组员 D', name: '成员 D', task: '补充 evidenceNotes 中的拍照和 README 证据说明'),
  ];

  static const List<String> androidTasks = [
    '选择一台主运行电脑、一台 Android 手机和第二部拍照手机',
    '准备 Flutter SDK、Android Studio、Android SDK 和 Platform-Tools',
    '打开手机开发者选项、USB 调试和文件传输 / MTP 模式',
    '使用 adb devices 确认设备状态为 device',
    '使用 flutter doctor -v 和 flutter devices 检查环境',
    '使用 flutter run 在真实 Android 手机上运行应用',
  ];

  static const List<String> evidenceNotes = [
    '不能提交 Web 截图或模拟器截图。',
    '不能使用手机直接截图代替照片。',
    '必须用第二部手机拍摄，并拍到手持真机。',
    '照片需放入 images/android-real-device.jpg，并在 GitHub README 中显示。',
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
            Text(PracticeAndroidHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text(PracticeAndroidHomePage.deviceProof, style: TextStyle(fontWeight: FontWeight.w600)),
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
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...PracticeAndroidHomePage.members.map((member) => MemberCard(member: member)),
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
            const Text('Android 真机运行任务', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...PracticeAndroidHomePage.androidTasks.map((task) => Text('• $task')),
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
            const Text('真机照片证据要求', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...PracticeAndroidHomePage.evidenceNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
