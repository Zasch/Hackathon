package de.clubi.recipe

class RecipeParser {
	
	public static void main(String[] args) {
		new RecipeParser().parse("example.txt")
	}
	
	def parse(String pathname) {
		Recipe recipe = new Recipe()
		
		def file = new File(pathname)
		file.splitEachLine(/\s/) { line ->
			line.each {word->
				if (word.length()>0) {
					println(word)
					
				}
			}
		}
		
	}
}
