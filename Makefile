# TODO 論文のurlを含めるとそのまま出力する
# git czによるコミット
commit:
	npx git-cz

# フォーマットの整形
fix:
	ruff --fix

# pythonのversionを指定してdockerコンテナを立ち上げる
up:
	@./bin/setup_docker.sh

# pythonのバージョンを変更
version:
	@./bin/rewrite_version.sh

# poetryを使ってライブラリを追加
add:
	@echo "Adding dependency via poetry. Please specify library: "
	@read library; \
	poetry add $$library

# poetryを使ってコマンドを実行
run:
	@echo "Running command via poetry. Please specify command: "
	@read command; \
	poetry run $$command
