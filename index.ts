import fs from 'fs';
import path from 'path';

const facts: { [key: string]: Array<string> } = {
	'has_plot': [],
	'directed_by': [],
	'written_by': [],
	'starred_actors': [],
	'release_year': [],
	'has_genre': [],
	'has_tags': [],
	'in_language': [],
};

const movies: Array<string> = [];

const data = fs.readFileSync(path.resolve(__dirname, 'moviesData.txt'), { encoding: 'utf-8' });

data.split(/\r?\n/).forEach(line => {
	const describes = Object.keys(facts).find(el => line.includes(el));
	if (describes) {
		const [indexAndMovie, originalValue] = line.replace(new RegExp('\'', 'g'), '').replace(new RegExp('"', 'g'), '').split(describes);
		const movie = indexAndMovie.slice(2).trim();

		if (!movies.includes(movie)) {
			movies.push(movie);
		}

		let value = originalValue.trim();

		if (describes === 'starred_actors' || describes === 'has_tags' || describes === 'has_genre') {
			value = `[${value.split(',').map(el => `'${el.trim()}'`).join(',')}]`;
		} else {
			value = `'${value}'`;
		}

		facts[describes].push(`${describes}('${movie}', ${value}).`);
	}
});

let dataToWrite = '';

for (const key in facts) {
	dataToWrite += `\n${facts[key].join('\n')}`;
}

fs.writeFileSync(path.resolve(__dirname, 'mv.pl'), movies.map(el => `movie('${el}').`).join('\n'));
fs.writeFileSync(path.resolve(__dirname, 'db.pl'), dataToWrite);
