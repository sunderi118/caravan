class BlogsController < ApplicationController
	def index
		@blogs = Blog.all

	end

	def new

	@blog= Blog.new
	# ブログモデルと紐づいたデータをいれるための空の箱を定義
	# ＃インスタンスという。
	# ＠つけるとviewにおくれる
	end

	def create
		# 空箱作成
		# ストロングパラメータとはただのメソッド
		# セキュリティ強固
		blog = Blog.new (post_params)
		# blogをsave
		blog.save
		#他のviewに移動させるメソッド
		redirect_to "/blogs"
	end

	def show
		@blog = Blog.find(params[:id])
		# viewから送られてくる情報を探すfindメソッド
	end

	private
	# ブログパラムズを定義
	# viewから送られてきたデータを保存できる
	# ビューからのデータはparamsというメソッドの中にはいる
	# 情報の取捨選択をする働き
	# 管理者権限とかの情報が送られてくるのをふせぐため
	# 
	def  post_params 
		# blogに関するものだけ
		# :title :body :categoryだけ許可する
		params.require(:blog).permit(:title, :body, :category)
	end

end
