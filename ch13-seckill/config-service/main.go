package main

import (
	"fmt"
	"github.com/go-kit/kit/log"
	register "github.com/longjoy/micro-go-book/ch13-seckill/pkg/discover"
	"github.com/longjoy/micro-go-book/ch8-config/conf"
	"github.com/spf13/viper"

	"net/http"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	//创建日志组件
	var logger log.Logger
	{
		logger = log.NewLogfmtLogger(os.Stderr)
		logger = log.With(logger, "ts", log.DefaultTimestampUTC)
		logger = log.With(logger, "caller", log.DefaultCaller)
	}
	errc := make(chan error)
	go func() {
		c := make(chan os.Signal)
		signal.Notify(c, syscall.SIGINT, syscall.SIGTERM)
		errc <- fmt.Errorf("%s", <-c)
	}()

	//开始监听
	go func() {
		logger.Log("transport", "HTTP", "addr", "8081")
		register.Register()
		http.HandleFunc("/resumes", func(w http.ResponseWriter, req *http.Request) {
			//q := events.goreq.URL.Query().Get("q")
			_, _ = fmt.Fprintf(w, "个人信息：\n")
			_, _ = fmt.Fprintf(w, "姓名：%s，\n性别：%s，\n年龄 %d!", viper.GetString("resume.name"), conf.Resume.Sex, conf.Resume.Age) //这个写入到w的是输出到客户端的
		})
		errc <- http.ListenAndServe(":8081", nil)
	}()

	// 开始运行，等待结束
	error := <-errc
	//服务退出取消注册
	register.Deregister()
	logger.Log("exit", error)
}
