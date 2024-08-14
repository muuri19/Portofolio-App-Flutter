// project.dart

class Project {
  final String name;
  final String company;
  final String technology;
  final String github;
  final String banner;

  Project({required this.name, required this.company, required this.technology, required this.github, required this.banner});

  
}

List<Project> listProject = [
  Project(
      name: "Level Up Mobile",
      company: "Level Up",
      github: "https://github.com/muuri19/Multi-Platform-App-Developer",
      technology: 'Flutter, Supabase, Firebase, Express Js, Elysia Js, Bun Js',
      banner: 'Image 1'),
  Project(
      name: "Restaurant - Dicoding",
      company: "Dicoding",
      github: "https://github.com/muuri19/Multi-Platform-App-Developer",
      technology: 'Flutter',
      banner: 'Image 1'),
  Project(
      name: "The Silent Void",
      company: "The Silent Void Community",
      github: "https://github.com/muuri19/Multi-Platform-App-Developer",
      technology: 'Flutter, Firebase',
      banner: 'Image 1'),
];
