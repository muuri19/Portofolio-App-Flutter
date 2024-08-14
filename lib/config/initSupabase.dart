import 'package:muuri_project/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async {
  const supabaseUrl = "https://jobwizujlzdpgdenfnxs.supabase.co";
  const supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpvYndpenVqbHpkcGdkZW5mbnhzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEzNTI0NTksImV4cCI6MjAzNjkyODQ1OX0.6zSzq1v0xb8Kuz0BstcBvQV7VOt6EBEfQAgCYjDPEPQ";

  Constants.logger.i("Successfully Connect to Supabase");
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
}
