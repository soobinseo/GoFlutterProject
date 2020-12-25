package middlewares

import (
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/constants"
)

func ParseParamMiddleware(c *gin.Context) {

	c.Set(constants.CtxProfileId, c.Params.ByName(constants.ProfileId))

	c.Next()

}
