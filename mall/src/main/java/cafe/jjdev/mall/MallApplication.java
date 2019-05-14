package cafe.jjdev.mall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MallApplication {
	public static void main(String[] args) {
		System.out.println("=============Tomcat실행전 maim메서드 호출=================");
		SpringApplication.run(MallApplication.class, args);
		System.out.println("=============Spring구동 및 톰캣 실행 후 =================");
		System.out.println(""+
				"    | |     : :                  ::        \\   \\              ;;\n" + 
				"    J J     : :                  ::         \\   \\            ;;\n" + 
				"     L L    : :         __   _   _________   \\   \\          ;;\n" + 
				"     | |    : :        /  |`| |`|___   ___|`-.\\   \\        ;;\n" + 
				"     J J    : :       / . | | |  `-.| |`-. `-.`\\   \\      ;;\n" + 
				"      L L   : :      / /| | | |     | |   `-. `-\\   \\    ;;\n" + 
				"      | |   : :     / /_| | | |     | |      `-. \\   \\. ;;\n" + 
				"      J J   : :    / ___  | | |     | |         `-\\   \\`-.\n" + 
				"       L L  : :   / /`-.| | | |___  | |  _         \\   \\-.`-._\n" + 
				"       | |  : :  /_/____|_|_|_____|_|_|_(_) _       \\   \\ `-._`:\n" + 
				"       J J  : : |__________________________| `-.     \\   \\-.,-'\n" + 
				"        L L : :      _  _  _ _       _  ___ `-. `-.   \\   \\ |\n" + 
				"        | | :_:   /\\(_`/ `-| |`-_/\\-| )-_| `-. `-. `-. \\   \\|\n" + 
				"        J J | |  /--\\_)\\_,_|_|__/--\\|_\\__|__  `-. `-._`-\\   \\\n" + 
				"         L L|_| |___________________________|`-. `-._ `-.\\   \\\n" + 
				"         | |   |    _____   ___      ___     `-.`-._ `-._ \\ ,!`-.\n" + 
				"         J J   |   |  ___|`/ _ \\`-._/ _ \\`--.   `-._`--._`-'||`-'\n" + 
				"          L L  |   | |_   / /_\\ \\  / / \\ \\   `-._   `--. `-,+.`-._\n" + 
				"       __-------_  |  _|`/ _____ \\ \\ \\_/ /_._    `--._  `-.|X||-./\n" + 
				"      |          |/|_|_./_/_____\\_\\_\\_____/=\\`-._     `-.  |X||.|\n" + 
				"      |       _,--------------.____ -========\\_(A)`-.._  `-|X||\\\n" + 
				"  Ool |     _|                     `         |_`--.    `-- |X||/\n" + 
				"  /VK |    | | ALT.ASCII-ART: FREQUENTLY ASKED QUESTIONS   / ||-.");
		System.out.println("  .   ____          _            __ _ _\n" + 
				" /\\\\ / ___'_ __ _ _(_)_ __  __ _ \\ \\ \\ \\\n" + 
				"( ( )\\___ | '_ | '_| | '_ \\/ _` | \\ \\ \\ \\\n" + 
				" \\\\/  ___)| |_)| | | | | || (_| |  ) ) ) )\n" + 
				"  '  |____| .__|_| |_|_| |_\\__, | / / / /\n" + 
				" =========|_|==============|___/=/_/_/_/");
		
	}
}